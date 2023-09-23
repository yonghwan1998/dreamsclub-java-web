package xyz.dreams.service;

import xyz.dreams.dto.Payment;

public interface PaymentService {
	void addPayment(Payment payment);
	void modifyPayment(Payment payment);

	String getAccessToken(Payment payment);
	Payment getPayment(String accessToken, String impUid);
	String cancelPayment(String accessToken, Payment payment);
}
