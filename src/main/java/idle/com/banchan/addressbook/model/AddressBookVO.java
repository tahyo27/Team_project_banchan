package idle.com.banchan.addressbook.model;

import lombok.Data;

@Data
public class AddressBookVO {

	private int num;
	private int member_num;
	private String ab_name;
	private String ab_zipcode;
	private String ab_address1;
	private String ab_address2;
	private String ab_tel;
	private int ab_base;
	
	
//	NUM
//	MEMBER_NUM
//	AB_NAME
//	AB_ZIPCODE
//	AB_ADDRESS1
//	AB_ADDRESS2
//	AB_TEL
//	AB_BASE 0:디폴트 X 1:기본배송지로 설정
}
