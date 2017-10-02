package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.ProductCategoryBean;
import DrRAJ.Utils.DBConnection;

public class ProductCategoryDAO {

	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	boolean result = false;

	public boolean insert(ProductCategoryBean productCategoryBean) {
		connection = DBConnection.getConnection();
		if (connection != null) {
			String insertSQL = "INSERT INTO productCategory(productCategoryId,productCategoryName)" + " values(?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, productCategoryBean.getProductCategoryId());
				pstmt.setString(2, productCategoryBean.getProductCategoryName());
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

	public List<ProductCategoryBean> getList() {

		List<ProductCategoryBean> listOfProductCategory = new ArrayList<ProductCategoryBean>();
		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from productCategory order by productCategoryName";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				ProductCategoryBean productCategory = null;
				while (rs.next()) {
					productCategory = new ProductCategoryBean();

					productCategory.setProductCategoryId(rs.getString("productCategoryId"));
					productCategory.setProductCategoryName(rs.getString("productCategoryName"));
					listOfProductCategory.add(productCategory);
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

		return listOfProductCategory;

	}

	public boolean isProductCategoryExists(String productCategoryName) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from productCategory where productCategoryName=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);
				pstmt.setString(1, productCategoryName);
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

	public boolean delete(String productCategoryId) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String deleteSQL = "DELETE FROM productCategory WHERE productCategoryId=?";

			try {
				pstmt = connection.prepareStatement(deleteSQL);

				pstmt.setString(1, productCategoryId);

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

	public ProductCategoryBean getByPK(String productCategoryId) {

		connection = DBConnection.getConnection();
		ProductCategoryBean productCategory = new ProductCategoryBean();

		if (connection != null) {
			String selectSQL = "Select * from productCategory WHERE productCategoryId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, productCategoryId);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					productCategory.setProductCategoryId(rs.getString("productCategoryId"));
					productCategory.setProductCategoryName(rs.getString("productCategoryName"));

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
		return productCategory;
	}

	public boolean update(ProductCategoryBean productCategoryBean) {
		connection = DBConnection.getConnection();

		if (connection != null) {
			String updateSQL = "UPDATE productCategory set productCategoryName=? WHERE productCategoryId=?";

			try {
				pstmt = connection.prepareStatement(updateSQL);

				pstmt.setString(1, productCategoryBean.getProductCategoryName());
				pstmt.setString(2, productCategoryBean.getProductCategoryId());

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
