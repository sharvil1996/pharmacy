package DrRAJ.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static Connection connection = null;

	public static Connection getConnection() {

		try {
			//Class.forName("org.postgresql.Driver");
			 Class.forName("com.mysql.jdbc.Driver");
			 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy","root","");
			// connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pharmacy","postgres", "root");
			//connection = DriverManager.getConnection("jdbc:postgresql://ec2-184-73-174-10.compute-1.amazonaws.com:5432/d7qgeeg48ojv22?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory","zopwvkvczshmhm", "6d01df136b2b7e44c53150d2af68c5f40b3deb2d61e2a6aaccabe46f3461c488");
			if (connection != null) {

			} else {

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}

}
