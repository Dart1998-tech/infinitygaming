package org.generationitaly.infinitygaming.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class JdbcUtil {








	static final String CONN_STR = "jdbc:hsqldb:3306://localhost/infinity_gaming";

	static {
	    try {
	        Class.forName("org.hsqldb.jdbcDriver");
	    } catch (ClassNotFoundException ex) {
	        System.err.println("Unable to load HSQL JDBC driver");
	    }
	}

	public static Connection getConnection() throws SQLException {
	    return DriverManager.getConnection(CONN_STR);
	}
	}
