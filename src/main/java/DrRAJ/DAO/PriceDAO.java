package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DrRAJ.Bean.PriceBean;
import DrRAJ.Utils.DBConnection;

public class PriceDAO {

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	boolean result = false;

	public boolean insert(PriceBean bean) {
		conn = DBConnection.getConnection();

		if (conn != null) {
			String insertSQL = "INSERT INTO price(priceId,productId,price,packageSize) values(?,?,?,?)";
			try {

				pstmt = conn.prepareStatement(insertSQL);
				pstmt.setString(1, bean.getPriceId());
				pstmt.setString(2, bean.getProductId());
				pstmt.setString(3, bean.getPrice());
				pstmt.setString(4, bean.getPackageSize());

				int rowsAffected = pstmt.executeUpdate();

				if (rowsAffected > 0) {
					result = true;
				} else {
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return result;
	}

	public ArrayList<PriceBean> getList() {
		ArrayList<PriceBean> list = new ArrayList<PriceBean>();
		String sql = "select * from price,product where price.productId=product.productId";
		conn = DBConnection.getConnection();
		if (conn != null) {
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				PriceBean bean = null;
				while (rs.next()) {
					bean = new PriceBean();
					bean.setProductId(rs.getString("productId"));
					bean.setPriceId(rs.getString("priceId"));
					bean.setProductName(rs.getString("productName"));
					bean.setPackageSize(rs.getString("packageSize"));
					bean.setPrice(rs.getString("price"));
					list.add(bean);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return list;
	}

	public boolean delete(String priceId) {

		conn = DBConnection.getConnection();

		if (conn != null) {
			String deleteSQL = "DELETE FROM price WHERE priceId=?";

			try {
				pstmt = conn.prepareStatement(deleteSQL);

				pstmt.setString(1, priceId);

				int rowsAffected = pstmt.executeUpdate();

				if (rowsAffected > 0) {
					result = true;
				} else {
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return result;
	}

	public PriceBean getByPK(String priceId) {

		conn = DBConnection.getConnection();
		PriceBean bean = null;
		if (conn != null) {
			String selectSQL = "select * from price where priceId=?";
			try {
				pstmt = conn.prepareStatement(selectSQL);

				pstmt.setString(1, priceId);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					bean = new PriceBean();
					bean.setProductId(rs.getString("productId"));
					bean.setPriceId(rs.getString("priceId"));
					bean.setPackageSize(rs.getString("packageSize"));
					bean.setPrice(rs.getString("price"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bean;
	}

	public boolean update(PriceBean bean) {
		conn = DBConnection.getConnection();

		if (conn != null) {
			String updateSQL = "UPDATE price set productId=?,price=?,packageSize=? WHERE priceId=?";

			try {
				pstmt = conn.prepareStatement(updateSQL);

				pstmt.setString(1, bean.getProductId());
				pstmt.setString(2, bean.getPrice());
				pstmt.setString(3, bean.getPackageSize());
				pstmt.setString(4, bean.getPriceId());

				int rowsAffected = pstmt.executeUpdate();

				if (rowsAffected > 0) {
					result = true;
				} else {
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
