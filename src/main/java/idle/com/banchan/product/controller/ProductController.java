package idle.com.banchan.product.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import idle.com.banchan.product.model.ProductVO;
import idle.com.banchan.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@Autowired
	ServletContext sContext;

	
	@RequestMapping(value = "/pr_selectAll.do", method = RequestMethod.GET)
	public String pr_selectAll(Model model) {
		log.info("/pr_selectAll.do.....");

		List<ProductVO> vos = service.selectAll();
		log.info("vos:{}", vos);
		
		model.addAttribute("vos", vos);

		return "product/selectAll";
	}
	
	@RequestMapping(value = "/pr_insert.do", method = RequestMethod.GET)
	public String pr_insert() {
		
		log.info("/pr_insert.do.....");

		return "product/insert";
	}
	
	
	
	
	@RequestMapping(value = "/pr_insertOK.do", method = RequestMethod.POST)
	public String pr_insertOK(ProductVO vo) throws IllegalStateException, IOException{
		log.info("/pr_insertOK.do...{}",vo);
		
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength =vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}",getOriginalFilename);
		log.info("fileNameLength:{}",fileNameLength);
		
		if(getOriginalFilename.length() != 0) {
			vo.setProduct_img(getOriginalFilename);
			
			String realPath=sContext.getRealPath("resources/uploadimg");
			log.info("realPath:{}",realPath);
			
			File f = new File(realPath+"\\"+vo.getProduct_img());
			vo.getFile().transferTo(f); 
			
			
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
					
			File thumb_file = new File(realPath + "/thumb_" + vo.getProduct_img());
			String formatName = vo.getProduct_img().substring(vo.getProduct_img().lastIndexOf(".")+1);
			log.info("formatName:{}",formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file); 
			
		} else {
			vo.setProduct_img("pro_default.png");
		}
		
		log.info("{}",vo);
		

		int result = service.insert(vo);
		log.info("result:{}",result);
		
		if(result==1) {
			return "redirect:pr_selectAll.do";
		}else {
			return "redirect:pr_insert.do";
		}
		
	}
	
	
}//end class