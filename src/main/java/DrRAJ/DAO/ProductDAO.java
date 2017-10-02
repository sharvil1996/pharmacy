package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.ProductBean;
import DrRAJ.Utils.DBConnection;

public class ProductDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	boolean result = false;

	public boolean insert(ProductBean productBean) {
		connection = DBConnection.getConnection();
		if (connection != null) {
			String insertSQL = "INSERT INTO product(productId, productName, imageLink, forwardLink, "
					+ "interaction, sideEffect, contraIndication, purpose, "
					+ "description, remediesId, productCategoryId) " + "values (?,?,?,?,?,?,?,?,?,?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, productBean.getProductId());
				pstmt.setString(2, productBean.getProductName());
				pstmt.setString(3, productBean.getImageLink());
				pstmt.setString(4, productBean.getForwardLink());
				pstmt.setString(5, productBean.getInteraction());
				pstmt.setString(6, productBean.getSideEffect());
				pstmt.setString(7, productBean.getContraIndication());
				pstmt.setString(8, productBean.getPurpose());
				pstmt.setString(9, productBean.getDescription());
				pstmt.setString(10, productBean.getRemediesId());
				pstmt.setString(11, productBean.getProductCategoryId());
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

	public boolean isProductExists(String name) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from product where productName=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);
				pstmt.setString(1, name);
				ResultSet rs = pstmt.executeQuery();
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

	public List<ProductBean> getList() {

		List<ProductBean> listOfProduct = new ArrayList<ProductBean>();
		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from product p,remedies r,productcategory pc WHERE p.remediesId=r.remediesId and pc.productCategoryId=p.productCategoryId";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				ProductBean product = null;
				while (rs.next()) {
					product = new ProductBean();

					product.setProductId(rs.getString("productId"));
					product.setDescription(rs.getString("description"));
					product.setImageLink(rs.getString("imageLink"));
					product.setContraIndication(rs.getString("contraIndication"));
					product.setForwardLink(rs.getString("forwardLink"));
					product.setProductCategoryId(rs.getString("productCategoryId"));
					product.setProductId(rs.getString("productId"));
					product.setProductName(rs.getString("productName"));
					product.setPurpose(rs.getString("purpose"));
					product.setRemediesId(rs.getString("remediesId"));
					product.setRemediesName(rs.getString("name"));
					product.setProductCategoryName(rs.getString("productCategoryName"));
					product.setSideEffect(rs.getString("sideEffect"));
					product.setInteraction(rs.getString("interaction"));
					listOfProduct.add(product);
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

		return listOfProduct;

	}

	public ProductBean getByPK(String productId) {

		connection = DBConnection.getConnection();
		ProductBean product = new ProductBean();

		if (connection != null) {
			String selectSQL = "Select * from product p,remedies r,productcategory pc WHERE p.remediesId=r.remediesId and pc.productCategoryId=p.productCategoryId and productId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, productId);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					product.setProductId(rs.getString("productId"));
					product.setDescription(rs.getString("description"));
					product.setImageLink(rs.getString("imageLink"));
					product.setContraIndication(rs.getString("contraIndication"));
					product.setForwardLink(rs.getString("forwardLink"));
					product.setProductCategoryId(rs.getString("productCategoryId"));
					product.setProductId(rs.getString("productId"));
					product.setProductName(rs.getString("productName"));
					product.setPurpose(rs.getString("purpose"));
					product.setRemediesId(rs.getString("remediesId"));
					product.setRemediesName(rs.getString("name"));
					product.setProductCategoryName(rs.getString("productCategoryName"));
					product.setSideEffect(rs.getString("sideEffect"));
					product.setInteraction(rs.getString("interaction"));
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
		return product;
	}

	public boolean update(ProductBean productBean) {
		connection = DBConnection.getConnection();

		if (connection != null) {
			String updateSQL = "UPDATE product set productName=?, imageLink=?, forwardLink=?, "
					+ "interaction=?, sideEffect=?, contraIndication=?, purpose=?, "
					+ "description=?, remediesId=?, productCategoryId=? where productId=?";
			try {
				pstmt = connection.prepareStatement(updateSQL);
				pstmt.setString(11, productBean.getProductId());
				pstmt.setString(1, productBean.getProductName());
				pstmt.setString(2, productBean.getImageLink());
				pstmt.setString(3, productBean.getForwardLink());
				pstmt.setString(4, productBean.getInteraction());
				pstmt.setString(5, productBean.getSideEffect());
				pstmt.setString(6, productBean.getContraIndication());
				pstmt.setString(7, productBean.getPurpose());
				pstmt.setString(8, productBean.getDescription());
				pstmt.setString(9, productBean.getRemediesId());
				pstmt.setString(10, productBean.getProductCategoryId());
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

	public boolean delete(String productId) {

		connection = (Connection) DBConnection.getConnection();
		if (connection != null) {
			String sql = "delete from product where productId=?";
			PreparedStatement statement;
			try {
				statement = connection.prepareStatement(sql);
				statement.setString(1, productId);
				int row = statement.executeUpdate();

				if (row != 0) {
					return true;
				}

			} catch (Exception e) {

			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return false;
	}

}
