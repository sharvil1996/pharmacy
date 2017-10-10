package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DrRAJ.Bean.ProductCompositionBean;
import DrRAJ.Utils.DBConnection;

public class ProductCompositionDAO {

	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	boolean result = false;

	public boolean insert(ProductCompositionBean bean) {
		connection = DBConnection.getConnection();
		if (connection != null) {
			String insertSQL = "INSERT INTO productcomposition(productCompositionId, productId, compositionContent, ingredientsId) VALUES (?,?,?,?)";
			try {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(insertSQL);
				pstmt.setString(1, bean.getProductCompositionId());
				pstmt.setString(2, bean.getProductId());
				pstmt.setString(3, bean.getCompositionContent());
				pstmt.setString(4, bean.getIngredientsId());
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

	public List<ProductCompositionBean> getList() {

		List<ProductCompositionBean> listOfProductComposition = new ArrayList<ProductCompositionBean>();
		connection = DBConnection.getConnection();

		if (connection != null) {
			String selectSQL = "Select * from productComposition pc,product p,ingredients i where pc.productId=p.productId and pc.ingredientsId=i.ingredientsId";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				rs = pstmt.executeQuery();

				ProductCompositionBean productComposition = null;
				while (rs.next()) {
					productComposition = new ProductCompositionBean();

					productComposition.setCompositionContent(rs.getString("compositionContent"));
					productComposition.setIngredientsId(rs.getString("ingredientsId"));
					productComposition.setIngredientsName(rs.getString("title"));
					productComposition.setProductCompositionId(rs.getString("productCompositionId"));
					productComposition.setProductId(rs.getString("productId"));
					productComposition.setProductName(rs.getString("productName"));
					listOfProductComposition.add(productComposition);
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

		return listOfProductComposition;

	}

	public boolean delete(String productCompositionId) {

		connection = DBConnection.getConnection();

		if (connection != null) {
			String deleteSQL = "DELETE FROM productComposition WHERE productCompositionId=?";

			try {
				pstmt = connection.prepareStatement(deleteSQL);

				pstmt.setString(1, productCompositionId);

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

	public ProductCompositionBean getByPK(String productCompositionId) {

		connection = DBConnection.getConnection();
		ProductCompositionBean productComposition = new ProductCompositionBean();

		if (connection != null) {
			String selectSQL = "Select * from productComposition pc,product p,ingredients i where pc.productId=p.productId and pc.ingredientsId=i.ingredientsId and productCompositionId=?";
			try {
				pstmt = connection.prepareStatement(selectSQL);

				pstmt.setString(1, productCompositionId);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					productComposition.setCompositionContent(rs.getString("compositionContent"));
					productComposition.setIngredientsId(rs.getString("ingredientsId"));
					productComposition.setIngredientsName(rs.getString("title"));
					productComposition.setProductCompositionId(rs.getString("productCompositionId"));
					productComposition.setProductId(rs.getString("productId"));
					productComposition.setProductName(rs.getString("productName"));
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
		return productComposition;
	}

	public boolean update(ProductCompositionBean productCompositionBean) {
		connection = DBConnection.getConnection();

		if (connection != null) {
			String updateSQL = "UPDATE productcomposition SET productId=?,compositionContent=?,ingredientsId=? WHERE productCompositionId=?";

			try {
				pstmt = connection.prepareStatement(updateSQL);

				pstmt.setString(1, productCompositionBean.getProductId());
				pstmt.setString(2, productCompositionBean.getCompositionContent());
				pstmt.setString(3, productCompositionBean.getIngredientsId());
				pstmt.setString(4, productCompositionBean.getProductCompositionId());

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
