package idle.com.banchan.addressbook.model;

import java.util.List;

public interface AddressBookDAO {
	
	public List<AddressBookVO> selectAll(AddressBookVO vo);

	int insert(AddressBookVO vo);

	int update(AddressBookVO vo);

	int delete(AddressBookVO vo);

}
