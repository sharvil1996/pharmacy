package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.RemediesBean;
import DrRAJ.Utils.DBConnection;

public class RemediesDAO {

	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	boolean result = false;

	public boolean insert(RemediesBean remediesBean) {
		connection = DBConnection.getConnection();
		if (connection != null) {
			String insertSQL = "INSERT INTO remedies(remediesId,photoLink,name)" + " values(?,?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, remediesBean.getRemediesId());
				pstmt.setString(2, remediesBean.getPhotolink());
				pstmt.setString(3, remediesBean.getName());
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

	public List<RemediesBean> getList() {

		List<RemediesBean> listOfRemedies = new ArrayList<RemediesBean>();
		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from remedies";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				RemediesBean testimonial = null;
				while (rs.next()) {
					testimonial = new RemediesBean();

					testimonial.setRemediesId((rs.getString("remediesId")));
					testimonial.setPhotolink(rs.getString("photoLink"));
					testimonial.setName(rs.getString("name"));
					listOfRemedies.add(testimonial);
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

		return listOfRemedies;

	}

	public boolean isRemediesExists(String name) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from remedies where name=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);
				pstmt.setString(1, name);
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

	public boolean delete(String testimonialId) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String deleteSQL = "DELETE FROM remedies WHERE remediesId=?";

			try {
				pstmt = connection.prepareStatement(deleteSQL);

				pstmt.setString(1, testimonialId);

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

	public RemediesBean getByPK(String testimonialId) {

		connection = DBConnection.getConnection();
		RemediesBean remediesBean = new RemediesBean();

		if (connection != null) {
			String selectSQL = "Select * from remedies WHERE remediesId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, testimonialId);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					remediesBean.setRemediesId(rs.getString("remediesId"));
					remediesBean.setPhotolink(rs.getString("photoLink"));
					remediesBean.setName(rs.getString("name"));
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
		return remediesBean;
	}

	public boolean update(RemediesBean remediesBean) {
		connection = DBConnection.getConnection();

		if (connection != null) {
			String updateSQL = "UPDATE remedies set photoLink=?,name=? WHERE remediesId=?";
			try {
				pstmt = connection.prepareStatement(updateSQL);
				pstmt.setString(1, remediesBean.getPhotolink());
				pstmt.setString(2, remediesBean.getName());
				pstmt.setString(3, remediesBean.getRemediesId());
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
