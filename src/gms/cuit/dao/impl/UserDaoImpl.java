package gms.cuit.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import gms.cuit.dao.UserDao;
import gms.cuit.entity.Gms_User;
import gms.cuit.utils.DataSourceUtils;

public class UserDaoImpl implements UserDao {
	
	//注册用户
	public int regist(Gms_User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into gms_user values(?,?,?,?,?,?,?)";
		int update = runner.update(sql,user.getUser_Id(),user.getUser_Password(),user.getUser_Sex(),
				user.getUser_Age(),user.getUser_Email(),user.getIs_Student(), 0);
		return update;
	}

	//用户登录
	public Gms_User login(String id, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from gms_user where user_id=? and user_password=?";
		return runner.query(sql, new BeanHandler<Gms_User>(Gms_User.class), id,password);
	}

	//修改密码
	public void update_password(String username, String newpassword) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update gms_user set user_password=? where user_id=?";
		runner.update(sql, newpassword,username);
	}

	//校验id是否存在
	public Long checkUsername(String userid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from gms_user where user_id = ?";
		Long query = (Long) runner.query(sql,new ScalarHandler(),userid);
		return query;
	}

	@Override
	public Gms_User getById(String user_id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select user_id,user_sex,user_age,user_email,balance from gms_user where user_id = ?";
		Gms_User user = (Gms_User) runner.query(sql,new BeanHandler<Gms_User>(Gms_User.class),user_id);
		return user;
	}

	@Override
	public void updateBalance(Gms_User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update gms_user set balance=? where user_id=?";
		runner.update(sql, user.getBalance(),user.getUser_Id());
	}

}
