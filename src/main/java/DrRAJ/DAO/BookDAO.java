package DrRAJ.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import DrRAJ.Bean.BookBean;
import DrRAJ.Utils.DBConnection;

public class BookDAO {

	Connection conn;

	public boolean insert(BookBean bean) {

		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "insert into book(bookId,photoLink,name,type,description,urlLink,author,isbn) values(?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement statement = conn.prepareStatement(sql);
				statement.setString(1, bean.getBookId());
				statement.setString(2, bean.getPhotolink());
				statement.setString(3, bean.getName());
				statement.setString(4, bean.getType());
				statement.setString(5, bean.getDescription());
				statement.setString(6, bean.getUrllink());
				statement.setString(7, bean.getAuthor());
				statement.setString(8, bean.getIsbn());

				int row = statement.executeUpdate();

				if (row != 0)
					return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		return false;
	}

	public ArrayList<BookBean> getList() {
		ArrayList<BookBean> list = new ArrayList<BookBean>();
		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "select * from book";
			PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				ResultSet rs = statement.executeQuery();
				BookBean bean = new BookBean();
				while (rs.next()) {
					bean = new BookBean();
					bean.setDescription(rs.getString("description"));
					bean.setBookId(rs.getString("bookId"));
					bean.setPhotolink(rs.getString("photoLink"));
					bean.setName(rs.getString("name"));
					bean.setType(rs.getString("type"));
					bean.setUrllink(rs.getString("urlLink"));
					bean.setAuthor(rs.getString("author"));
					bean.setIsbn(rs.getString("isbn"));
					list.add(bean);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public boolean delete(String bookId) {

		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "delete from book where bookId=?";
			PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setString(1, bookId);
				int row = statement.executeUpdate();

				if (row != 0) {
					return true;
				}

			} catch (Exception e) {

			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return false;
	}

	public BookBean getByPK(String bookId) {

		BookBean bean = new BookBean();

		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "select * from book where bookId=?";
			PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setString(1, bookId);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					bean = new BookBean();
					bean.setDescription(rs.getString("description"));
					bean.setBookId(rs.getString("bookId"));
					bean.setPhotolink(rs.getString("photoLink"));
					bean.setName(rs.getString("name"));
					bean.setType(rs.getString("type"));
					bean.setUrllink(rs.getString("urlLink"));
					bean.setAuthor(rs.getString("author"));
					bean.setIsbn(rs.getString("isbn"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return bean;
	}

	public boolean isbnIsExists(String isbn) {

		BookBean bean = new BookBean();

		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "select * from book where isbn=?";
			PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setString(1, isbn);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public boolean update(BookBean bean) {
		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "update book set photoLink=?,name=?,type=?,description=?,urlLink=?,author=?,isbn=? where bookId=?";
			try {
				PreparedStatement statement = conn.prepareStatement(sql);

				statement.setString(1, bean.getPhotolink());
				statement.setString(2, bean.getName());
				statement.setString(3, bean.getType());
				statement.setString(4, bean.getDescription());
				statement.setString(5, bean.getUrllink());
				statement.setString(6, bean.getAuthor());
				statement.setString(7, bean.getIsbn());
				statement.setString(8, bean.getBookId());

				int row = statement.executeUpdate();

				if (row != 0)
					return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		return false;
	}

	public ArrayList<BookBean> getBySubtypes(String type) {

		String subtype = new BookTypeDAO().getTypes(type).toString();
		System.out.println(subtype.substring(1, subtype.length() - 1));
		ArrayList<BookBean> list = new ArrayList<BookBean>();
		conn = (Connection) DBConnection.getConnection();
		if (conn != null) {
			String sql = "select * from book where type in (" + subtype.substring(1, subtype.length() - 1) + ")";
			PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				ResultSet rs = statement.executeQuery();
				BookBean bean = new BookBean();
				while (rs.next()) {
					bean = new BookBean();
					bean.setDescription(rs.getString("description"));
					bean.setBookId(rs.getString("bookId"));
					bean.setPhotolink(rs.getString("photoLink"));
					bean.setName(rs.getString("name"));
					bean.setType(rs.getString("type"));
					bean.setUrllink(rs.getString("urlLink"));
					bean.setAuthor(rs.getString("author"));
					bean.setIsbn(rs.getString("isbn"));
					list.add(bean);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println(list.size());
		return list;

	}

	public static void main(String[] args) {
		new BookDAO().getBySubtypes("Mind,Body & Spirit");
		new BookDAO().getBySubtypes("Homeopathic Self-Help");
	}

}
