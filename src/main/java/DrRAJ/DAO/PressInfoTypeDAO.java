package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.PressInfoTypeBean;
import DrRAJ.Bean.StateBean;
import DrRAJ.Utils.DBConnection;

public class PressInfoTypeDAO {

	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	boolean result = false;

	public boolean insert(PressInfoTypeBean pressInfoTypeBean) {
		connection = DBConnection.getConnection();
		if (connection != null) {
			String insertSQL = "INSERT INTO pressInfoType(typeId,name)" + " values(?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, pressInfoTypeBean.getTypeId());
				pstmt.setString(2, pressInfoTypeBean.getName());
				int rowsAffected = pstmt.executeUpdate();
				if (rowsAffected > 0) {
					result = true;
				}
			} catch (SQLException e) {
				try {
					connection.rollback();
					result = false;
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				try {
					connection.commit();
					connection.setAutoCommit(true);
					connection.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return result;
	}

	public List<PressInfoTypeBean> getList() {

		List<PressInfoTypeBean> listOfPressInfoType = new ArrayList<PressInfoTypeBean>();
		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from pressInfoType order by name";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				PressInfoTypeBean pressInfoType = null;
				while (rs.next()) {
					pressInfoType = new PressInfoTypeBean();

					pressInfoType.setTypeId(rs.getString("typeId"));
					pressInfoType.setName(rs.getString("name"));
					listOfPressInfoType.add(pressInfoType);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return listOfPressInfoType;

	}

	public boolean isPressInfoTypeExists(String pressInfoTypeName) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from pressInfoType where name=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);
				pstmt.setString(1, pressInfoTypeName);
				rs = pstmt.executeQuery();
				while (rs.next())
					return true;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public boolean delete(String PressInfoTypeId) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String deleteSQL = "DELETE FROM pressInfoType WHERE typeId=?";

			try {
				pstmt = connection.prepareStatement(deleteSQL);

				pstmt.setString(1, PressInfoTypeId);

				int rowsAffected = pstmt.executeUpdate();

				if (rowsAffected > 0) {
					result = true;
				} else {
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return result;
	}

	public PressInfoTypeBean getByPK(String pressInfoTypeId) {

		connection = DBConnection.getConnection();
		PressInfoTypeBean pressInfoType = new PressInfoTypeBean();

		if (connection != null) {
			String selectSQL = "Select * from pressInfoType WHERE typeId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, pressInfoTypeId);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					pressInfoType.setTypeId(rs.getString("typeId"));
					pressInfoType.setName(rs.getString("name"));

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pressInfoType;
	}

	public boolean update(PressInfoTypeBean pressInfoTypeBean) {
		connection = DBConnection.getConnection();

		if (connection != null) {
			String updateSQL = "UPDATE pressInfoType set name=? WHERE typeId=?";

			try {
				pstmt = connection.prepareStatement(updateSQL);

				pstmt.setString(1, pressInfoTypeBean.getName());
				pstmt.setString(2, pressInfoTypeBean.getTypeId());

				int rowsAffected = pstmt.executeUpdate();

				if (rowsAffected > 0) {
					result = true;

				} else {

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return result;
	}
}
