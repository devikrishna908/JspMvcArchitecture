package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.CategoryBean;

public class CategoryDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------START---------------get
	// connection------------------------

	/**
	 * 
	 * @return
	 * @throws SQLException
	 */

	public static Connection getDbConnection() throws SQLException {
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// ------------------END-----------------database connection--------------------

	// ------------------START----------------insert details-------------------------

	/**
	 * 
	 * @param categoryBean
	 * @return
	 * @throws SQLException
	 */

	public static boolean insertCategory(CategoryBean categoryBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("insert into category(cat_name) values(?)");
			pst.setString(1, categoryBean.getCaName());

			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	// -------------------END-----------------insert details-------------------------

	// -------------------START--------------list Categories-------------------------
	public static ArrayList<CategoryBean> getAllCategories() throws SQLException {

		ArrayList<CategoryBean> categoryBean = new ArrayList<CategoryBean>();

		con = getDbConnection();

		try {
			pst = con.prepareStatement("SELECT * FROM category");
			rs = pst.executeQuery();

			while (rs.next()) {
				CategoryBean category = new CategoryBean();
				category.setCaId(rs.getInt(1));
				category.setCaName(rs.getString(2));
				categoryBean.add(category);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryBean;
	}

	// --------------END -------------------------list Categories---------------------
	
	
	// -------------------START--------------Get Category Details By ID-------------------------
		public static ArrayList<CategoryBean> getCategoryDetailsById(CategoryBean categoryBean) throws SQLException {

			ArrayList<CategoryBean> category = new ArrayList<CategoryBean>();

			con = getDbConnection();

			try {
				pst = con.prepareStatement("SELECT * FROM category WHERE cat_id=?");
				pst.setInt(1, categoryBean.getCaId());
				rs = pst.executeQuery();

				while (rs.next()) {
					CategoryBean cat = new CategoryBean();
					cat.setCaId(rs.getInt(1));
					cat.setCaName(rs.getString(2));
					category.add(cat);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return category;
		}

	// --------------END ----------------Get Category Details By ID---------------------
	// ------------------START----------------Update Category -------------------------

		/**
		 * 
		 * @param categoryBean
		 * @return
		 * @throws SQLException
		 */

		public static boolean updateCategory(CategoryBean categoryBean) throws SQLException {
			boolean flag = false;
			try {
				con = getDbConnection();
				pst = con.prepareStatement("update category set cat_name = ? WHERE cat_id =?");
				pst.setString(1, categoryBean.getCaName());
				pst.setInt(2, categoryBean.getCaId());
				pst.executeUpdate();
				flag = true;

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return flag;
		}
		// -------------------END-----------------Update Category-------------------------

		// ------------------START----------------Delete Category -------------------------

		/**
		 * 
		 * @param categoryBean
		 * @return
		 * @throws SQLException
		 */

		public static boolean deleteCategory(CategoryBean categoryBean) throws SQLException {
			boolean flag = false;
			try {
				con = getDbConnection();
				pst = con.prepareStatement("DELETE FROM category WHERE cat_id =?");
				pst.setInt(1, categoryBean.getCaId());
				pst.executeUpdate();
				flag = true;

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return flag;
		}
		// -------------------END-----------------Delete Category-------------------------

}
