package gms.cuit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import gms.cuit.entity.Gms_Admin;
import gms.cuit.entity.Gms_Notice;
import gms.cuit.entity.Gms_Venue;
import gms.cuit.entity.Gms_User;
import gms.cuit.entity.Gms_Vdstate;

public interface AdminDao {
	public Gms_Admin login(Gms_Admin admin) throws SQLException;
	public void update_password(String username,String newpassword) throws SQLException;
	public void update_user(String userId,String balance) throws SQLException;

	public void add_notice(Gms_Notice notice) throws SQLException;
	public void del_notice(String notice_id) throws SQLException;
	public void update_notice(Gms_Notice notice) throws SQLException;
	public List<Gms_Notice> query_noticeByKey(int currentPage, int currentCount, String query_key) throws SQLException;
	public int get_noticeTotalCountByKeyQuery(String query_key) throws SQLException;
	
	public void add_venue(Gms_Venue venue) throws SQLException;
	public void del_venue(String venue_id) throws SQLException;
	public void del_venue_state(String venue_id) throws SQLException;
	public void update_venue(Gms_Venue venue) throws SQLException;
	public List<Gms_Venue> query_venueByKey(int currentPage, int currentCount, String query_key) throws SQLException;
	public List<Gms_User> query_userByKey(int currentPage, int currentCount, String query_key) throws SQLException;
	public int get_venueTotalCountByKeyQuery(String query_key) throws SQLException;
	public int get_userTotalCountByKeyQuery(String query_key) throws SQLException;

	public List<Map<String, Object>> query_orderByKey(int currentPage, int currentCount, String query_key, String sort_state) throws SQLException;
	public int get_orderTotalCountByKeyQuery(String query_key) throws SQLException;
	
	public List<Object[]> query_venuetype() throws SQLException;
	public int get_orderTotalCountByDate(String date_st, String date_ed) throws SQLException;
	public Double get_orderProfitByDateAndCat(String date_st, String date_ed, String catitemString) throws SQLException;
	public Integer get_orderRentByDateAndCat(String date_st, String date_ed, String catitemString) throws SQLException;
	public int get_orderUsageByDateAndCat(String date_st, String date_ed, String catitemString) throws SQLException;
	public int get_orderCountByDateAndCatAndSex(String date_st, String date_ed, String catitemString, String sex) throws SQLException;
	public int get_orderCountByDateAndCatAndAge(String date_st, String date_ed, String catitemString, int age) throws SQLException;
	
	public List<Object[]> query_venue() throws SQLException;
	public Double get_orderProfitByDateAndVen(String date_st, String date_ed, String venitemString) throws SQLException;
	public Integer get_orderRentByDateAndVen(String date_st, String date_ed, String venitemString) throws SQLException;
	public int get_orderUsageByDateAndVen(String date_st, String date_ed, String venitemString) throws SQLException;
	public int get_orderCountByDateAndVenAndSex(String date_st, String date_ed, String venitemString, String sex) throws SQLException;
	public int get_orderCountByDateAndVenAndAge(String date_st, String date_ed, String venitemString, int age) throws SQLException;
	
	public Integer get_summaryTodayOrderCount(String date_today) throws SQLException;
	public Double get_summaryTodayOrderProfit(String date_today) throws SQLException;
	public List<Map<String, Object>> query_orderByLatest(int get_count) throws SQLException;
	public int get_orderCountByDateAndVen(String date_today,String venitemString) throws SQLException;

	List<Gms_Vdstate> getVdstateStByVenueId(String venue_id) throws SQLException;
	public void update_vdstate(Gms_Vdstate state) throws SQLException;

    void inset(Gms_Vdstate gms_vdstate) throws SQLException;
}
