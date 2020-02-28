package rippleshop.bean.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RippleShopDAO {
	
	public List<ProductVO> readAllProduct() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ProductVO vo = null;
			while(rs.next()) {
				vo = new ProductVO();
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setCategory_code(rs.getString("category_code"));
				vo.setDelivery_code(rs.getString("delivery_code"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_amount(rs.getInt("product_amount"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setDelivery_price(rs.getInt("delivery_price"));
				vo.setDelivery_price_max(rs.getInt("delivery_price_max"));
				vo.setDelivery_if(rs.getString("delivery_if"));
				vo.setIntro_img(rs.getString("intro_img"));
				vo.setMain_img(rs.getString("main_img"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}
	
	public List<ProductVO> readCategoryProduct(String category_code) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where category_code=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category_code);
			
			rs = pstmt.executeQuery();
			
			ProductVO vo = null;
			while(rs.next()) {
				vo = new ProductVO();
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setCategory_code(rs.getString("category_code"));
				vo.setDelivery_code(rs.getString("delivery_code"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_amount(rs.getInt("product_amount"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setDelivery_price(rs.getInt("delivery_price"));
				vo.setDelivery_price_max(rs.getInt("delivery_price_max"));
				vo.setDelivery_if(rs.getString("delivery_if"));
				vo.setIntro_img(rs.getString("intro_img"));
				vo.setMain_img(rs.getString("main_img"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}	
	
	public ProductVO readProduct(int product_num) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ProductVO vo = null;
		
		String sql = "select * from product where product_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new ProductVO();
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setCategory_code(rs.getString("category_code"));
				vo.setDelivery_code(rs.getString("delivery_code"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_amount(rs.getInt("product_amount"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setDelivery_price(rs.getInt("delivery_price"));
				vo.setDelivery_price_max(rs.getInt("delivery_price_max"));
				vo.setDelivery_if(rs.getString("delivery_if"));
				vo.setIntro_img(rs.getString("intro_img"));
				vo.setMain_img(rs.getString("main_img"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return vo;
	}
	
	public MemberVO readMember(String email) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberVO vo = null;
		
		String sql = "select * from member where email=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setEmail(rs.getString("email"));
				vo.setPassword(rs.getString("password"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setZip(rs.getString("zip"));
				vo.setAddress(rs.getString("address"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return vo;
	}
	
	public void createSignup(MemberVO vo) {		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		
		String sql = "insert into member(email, password, name, phone, zip, address) values(?, ?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getZip());
			pstmt.setString(6, vo.getAddress());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
	}
	
	public void createPurchase(PurchaseVO vo) {		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		
		String sql = "insert into purchase(email, product_num, amount, price, memo) values(?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getEmail());
			pstmt.setInt(2, vo.getProduct_num());
			pstmt.setInt(3, vo.getAmount());
			pstmt.setDouble(4, vo.getPrice());
			pstmt.setString(5, vo.getMemo());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
	}
	
	
	
	public boolean readLoginCheck(String email, String password) {
		boolean isLogin = false;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select password from member where email=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(password)) {
					isLogin = true;
				}
				else {
					isLogin = false;
				}
			}
			else {
				isLogin = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return isLogin;
	}
	
	public List<PurchaseVO> readPurchaseList(String email) {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select purchase_num, email, pro.product_num, amount, price, memo, purchase_date, status, product_name, intro_img " 
				+ "from purchase pur, product pro where pur.product_num=pro.product_num and email=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			PurchaseVO vo = null;
			while(rs.next()) {
				vo = new PurchaseVO();
				
				vo.setPurchase_num(rs.getInt("purchase_num"));				
				vo.setEmail(rs.getString("email"));
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setAmount(rs.getInt("amount"));
				vo.setPrice(rs.getDouble("price"));
				vo.setMemo(rs.getString("memo"));
				vo.setPurchase_date(rs.getDate("purchase_date"));
				vo.setDeposit_chk(rs.getString("status"));
				
				vo.setProduct_name(rs.getString("product_name"));
				vo.setIntro_img(rs.getString("intro_img"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}
	
	public int readAskNum(int product_num) {
		int ask_num = 1;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(ask_num) from ask where product_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ask_num = rs.getInt("count(ask_num)") + 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return ask_num;
	}
	
	public AskVO readAsk(int ask_num) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from ask where ask_num=?";
		
		AskVO vo = new AskVO();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ask_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setContent(rs.getString("content"));
				vo.setTitle(rs.getString("title"));
				vo.setReply(rs.getString("reply"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return vo;
	}
	
	public void createAsk(AskVO vo) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		
		String sql = "insert into ask(product_num, title, content, writer, password) values(?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getProduct_num());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getWriter());
			pstmt.setString(5, vo.getPassword());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
	}
	
	public List<AskVO> readAskList(int product_num, int first, int num_per_page) {
		List<AskVO> list = new ArrayList<AskVO>();
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select ask_num, product_num, title, content, writer, date, password, reply from ask where product_num=? order by date desc limit ?, ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, first);
			pstmt.setInt(3, num_per_page);
			
			rs = pstmt.executeQuery();
			
			AskVO vo = null;
			while(rs.next()) {
				vo = new AskVO();
				
				vo.setAsk_num(rs.getInt("ask_num"));
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setDate(rs.getDate("date"));
				vo.setPassword(rs.getString("password"));
				vo.setReply(rs.getString("reply"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}
	
	public int readReviewNum(int product_num) {
		int review_num = 1;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(product_num) from review r, purchase p where r.purchase_num=p.purchase_num and product_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review_num = rs.getInt("count(product_num)") + 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return review_num;
	}
	
	public int readReviewAvg(int product_num) {
		int review_avg = 1;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select avg(star_score) from review r, purchase p where r.purchase_num=p.purchase_num and product_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review_avg = rs.getInt("avg(star_score)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return review_avg;
	}
	
	public List<ReviewVO> readReviewList(int product_num, int first, int num_per_page) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select p.email, p.product_num, r.purchase_num, star_score, content, review_img, review_date from review r, purchase p "
				+ "where r.purchase_num=p.purchase_num and product_num=? limit ?, ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, first);
			pstmt.setInt(3, num_per_page);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				
				vo.setEmail(rs.getString("email"));
				vo.setProduct_num(rs.getInt("product_num"));
				vo.setPurchase_num(rs.getInt("purchase_num"));
				vo.setStar_score(rs.getInt("star_score"));
				vo.setContent(rs.getString("content"));
				vo.setReview_img(rs.getString("review_img"));
				vo.setReview_date(rs.getDate("review_date"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}
	
	public void createReview(ReviewVO vo) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		
		String sql = "insert into review(purchase_num, star_score, content) values(?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getPurchase_num());
			pstmt.setInt(2, vo.getStar_score());
			pstmt.setString(3, vo.getContent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
	}
	
	public boolean readCheckReview(int purchase_num) {
		boolean review_check = false;

		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review where purchase_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, purchase_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review_check = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return review_check;
	}
	
	public void updateCancelPurchase(int purchase_num) {
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		
		String sql = "update purchase set status='C' where purchase_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, purchase_num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
	}
	
	public String readReplyToAsk(int ask_num) {
		String reply = null;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select reply from ask where ask_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ask_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reply = rs.getString("reply");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return reply;
	}
	
	public List<String> readSecretAsk(int ask_num) {
		List<String> list = new ArrayList<String>();
		
		String content = null;
		String reply = null;
		
		Connection con = DBConnection.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select content, password, reply from ask where ask_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ask_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list.add(rs.getString("content"));
				list.add(rs.getString("password"));
				list.add(rs.getString("reply"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
			if(con != null)try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}

}
