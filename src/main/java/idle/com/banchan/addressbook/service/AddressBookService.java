package idle.com.banchan.addressbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idle.com.banchan.addressbook.model.AddressBookDAO;
import idle.com.banchan.addressbook.model.AddressBookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AddressBookService {
	
	@Autowired
	AddressBookDAO dao;
	
	public AddressBookService() {
		log.info("AddressBookService().....");
	}
	
	public List<AddressBookVO> selectAll(AddressBookVO vo) {
		return dao.selectAll(vo);
	}
	
	public int insert(AddressBookVO vo) {
		return dao.insert(vo);
	}

	public int update(AddressBookVO vo) {
		return dao.update(vo);
	}

	public int delete(AddressBookVO vo) {
		return dao.delete(vo);
	}
}
