package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.ProductBean;
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
			String insertSQL = "INSERT INTO productcategory(productCategoryId,productCategoryName,url)"
					+ " values(?,?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, productCategoryBean.getProductCategoryId());
				pstmt.setString(2, productCategoryBean.getProductCategoryName());
				pstmt.setString(3, productCategoryBean.getForwardLink());
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
			String selectSQL = "Select * from productcategory order by productCategoryName";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				ProductCategoryBean productCategory = null;
				while (rs.next()) {
					productCategory = new ProductCategoryBean();

					productCategory.setProductCategoryId(rs.getString("productCategoryId"));
					productCategory.setForwardLink(rs.getString("url"));
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
			String selectSQL = "Select * from productcategory where productCategoryName=?";
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

	public ArrayList<ProductBean> getByURL(String productCategoryURL) {

		connection = DBConnection.getConnection();
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		ProductBean productBean = null;
		System.out.println(productCategoryURL);
		if (connection != null) {
			String selectSQL = "Select * from productcategory pc,product p where p.productCategoryId=pc.productCategoryId and pc.url=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, productCategoryURL);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					productBean = new ProductBean();
					productBean.setProductCategoryId(rs.getString("productCategoryId"));
					productBean.setProductCategoryName(rs.getString("productCategoryName"));
					productBean.setForwardLink(rs.getString("forwardLink"));
					productBean.setProductId(rs.getString("productId"));
					productBean.setDescription(rs.getString("description"));
					productBean.setImageLink(rs.getString("imageLink"));
					productBean.setContraIndication(rs.getString("contraIndication"));
					productBean.setForwardLink(rs.getString("forwardLink"));
					productBean.setProductCategoryId(rs.getString("productCategoryId"));
					productBean.setProductId(rs.getString("productId"));
					productBean.setProductName(rs.getString("productName"));
					productBean.setPurpose(rs.getString("purpose"));
					productBean.setRemediesId(rs.getString("remediesId"));
					productBean.setProductCategoryName(rs.getString("productCategoryName"));
					productBean.setSideEffect(rs.getString("sideEffect"));
					productBean.setInteraction(rs.getString("interaction"));
					productBean.setProductURL(rs.getString("productURL"));
					productBean.setCnt(rs.getInt("cnt") + "");
					list.add(productBean);
				}
				return list;

			} catch (SQLException e) {
				e.printStackTrace();
			}

			finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

	public boolean delete(String productCategoryId) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String deleteSQL = "DELETE FROM productcategory WHERE productCategoryId=?";

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
			String selectSQL = "Select * from productcategory WHERE productCategoryId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, productCategoryId);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					productCategory.setForwardLink(rs.getString("url"));
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
			String updateSQL = "UPDATE productcategory set productCategoryName=?,url=? WHERE productCategoryId=?";

			try {
				pstmt = connection.prepareStatement(updateSQL);

				pstmt.setString(1, productCategoryBean.getProductCategoryName());
				pstmt.setString(2, productCategoryBean.getForwardLink());
				pstmt.setString(3, productCategoryBean.getProductCategoryId());

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
