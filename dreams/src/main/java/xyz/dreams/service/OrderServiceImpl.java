package xyz.dreams.service;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
	private final OrderDAO orderDAO;
	private final CartDAO cartDAO;
	
	@Transactional
	@Override
	public void insert(OrderDTO order) {
		
		if (order.getNewSelected() == 1) {
			orderDAO.insert(order);
		}else {
			order.setMemberPcode(order.getMemberNewPcode());
			order.setMemberAddress1(order.getMemberNewAddress1());
			order.setMemberAddress2(order.getMemberNewAddress2());
			orderDAO.insert(order);
		}
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(order.getMemberId());
		cartVO.setGoodsCode(order.getGoodsCode());
		
		cartDAO.delFromCart(cartVO);
	}
	
	@Override
	public List<OrderDTO> myOrderList(String memberId) {
		return orderDAO.myOrderList(memberId);
	}
	
	@Override
	public List<OrderDTO> allOrderList() {
		return orderDAO.allOrderList();
	}
	
	@Override
	public OrderDTO selectByOrderId(String impUid) {
		return orderDAO.selectByOrderId(impUid);
	}
	@Override
	public boolean updateOrderStatus(OrderDTO orderDTO) {
		boolean result = orderDAO.updateOrderStatus(orderDTO);
		return result;
	}
	
	@Override
	public int orderCancel(OrderDTO orderDTO) {
		return orderDAO.orderCancel(orderDTO);
	}
	
	@Override
	public int getAmount() {
		return orderDAO.getAmount();
	}

	@Override
	public OrderDTO selectOrderId(String impUid, String memberId) {
		return orderDAO.selectOrderId(impUid, memberId);
	}

	@Override
	public String getAccessToken(OrderDTO payment) {
		String accessToken = "";
		// 토큰 발급을 요청하기 위한 API의 URL 주소
		String apiUrl = "https://api.iamport.kr/users/getToken";

		// 요청 API에게 전달될 값을 JSON 형식의 문자열로 표현하여 저장
		// => {"imp_key" : REST API Key, "imp_secret" : REST API Secret}
		String data="{\"imp_key\":\"4625482277266567\", \"imp_secret\":\"0b4N0IvKNTPYvcZRJWbMNH3QKEBmqnq7ubqStOrcuM1Qz6WUX2k6E66rUkNn9pAULzyj2cMCm7ouwJYu\"}";
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);// 응답결과를 반환하기 위해 필드값 변경
			connection.setRequestMethod("POST");// 요청 방식을 변경하기 위해 필드값 변경
			connection.setRequestProperty("Content-Type", "application/json");// 전달값의 형식을 변경하기 위해 필드값 변경

			// API 요청에 필요한 값을 출력스트림을 제공받아 전달
			try (OutputStream out = connection.getOutputStream()) {
				byte[] requestDate = data.getBytes("utf-8");
				out.write(requestDate);
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 응답코드를 반환받아 저장
			int responseCode = connection.getResponseCode();

			if (responseCode == 200) {// 정상적은 응답 결과를 제공받은 경우
				// 응답결과를 제공받기 위한 입력스트림을 확장하여 저장
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));

				// 입력스트림으로 응답결과를 얻어와 저장
				String input = "";
				String result = "";
				while ((input = br.readLine()) != null) {
					result += input;
				}
				br.close();

				System.out.println("result(Token) = " + result);

				// 응답결과(JSON 형식의 문자열)를 Java 객체로 변환하여 파싱 처리
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(result);

				JSONObject responseObject = (JSONObject) jsonObject.get("response");
				accessToken = (String) responseObject.get("access_token");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accessToken;
	}

	@Override
	public OrderDTO getPayment(String accessToken, String impUid) {
		OrderDTO payment=new OrderDTO();//응답결과를 저장하기 위한 객체 생성
		//결제번호를 전달하여 결재정보를 제공받기 위한 API의 URL 주소
		String apiUrl="https://api.iamport.kr/payments/"+impUid;
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection=(HttpURLConnection)url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Authorization", accessToken);
			
			int responseCode=connection.getResponseCode();

			if(responseCode == 200) {
				//응답결과를 제공받기 위한 입력스트림을 확장하여 저장
				BufferedReader br=new BufferedReader(new InputStreamReader(connection.getInputStream()));
				
				//입력스트림으로 응답결과를 얻어와 저장
				String input="";
				String result="";
				while((input = br.readLine()) != null) {
					result+=input;
				}
				br.close();
			
				System.out.println("result(payment) = "+result);
				
				//응답결과(JSON 형식의 문자열)를 Java 객체로 변환하여 파싱 처리 
				JSONParser parser=new JSONParser();
				JSONObject jsonObject=(JSONObject)parser.parse(result);
	
				JSONObject responseObject=(JSONObject)jsonObject.get("response");
				
				payment.setImpUid((String)responseObject.get("imp_uid"));
				payment.setMerchantUid((String)responseObject.get("merchant_uid"));
				payment.setGoodsPrice((Long)responseObject.get("amount"));
				payment.setStatus((String)responseObject.get("status"));
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return payment;
	}

	@Override
	public void addPayment(OrderDTO payment) {
		System.out.println("PAYMENT 테이블에 결재 정보를 삽입하는 명령");
		System.out.println(payment);
	}

	@Override
	public String canclePayment(String accessToken, OrderDTO payment) {
		// 결재 취소를 요청하기 위한 API의 URL 주소
		String apiUrl = "https://api.iamport.kr/payments/cancel";
		// 요청 API에게 전달될 값을 JSON 형식의 문자열로 표현하여 저장
		// => {"imp_uid" : 결재고유값, "checksum" : 취소금액}
		String data = "{\"imp_uid\":\"" + payment.getImpUid() + "\", \"checksum\":\"" + payment.getGoodsPrice() + "\"}";

		System.out.println(data);

		String returnValue = "";
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);// 응답결과를 반환하기 위해 필드값 변경
			connection.setRequestMethod("POST");// 요청 방식을 변경하기 위해 필드값 변경
			connection.setRequestProperty("Content-Type", "application/json");// 전달값의 형식을 변경하기 위해 필드값 변경
			connection.setRequestProperty("Authorization", accessToken);

			// API 요청에 필요한 값을 출력스트림을 제공받아 전달
			try (OutputStream out = connection.getOutputStream()) {
				byte[] requestDate = data.getBytes("utf-8");
				out.write(requestDate);
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 응답코드를 반환받아 저장
			int responseCode = connection.getResponseCode();

			if (responseCode == 200) {// 정상적은 응답 결과를 제공받은 경우
				returnValue = "success";
			} else {
				returnValue = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return returnValue;
	}
	
}
