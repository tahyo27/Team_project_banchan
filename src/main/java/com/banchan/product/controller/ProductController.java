package com.banchan.product.controller;

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

import com.banchan.cart.model.CartVO;
import com.banchan.cart.service.CartService;
import com.banchan.product.model.ProductVO;
import com.banchan.product.service.ProductService;
import com.banchan.review.model.ReviewVO;
import com.banchan.review.service.ReviewService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ServletContext sContext;

	
	@RequestMapping(value = "/pr_selectAll.do", method = RequestMethod.GET)
	public String pr_selectAll(Model model) {
		log.info("/pr_selectAll.do.....");

		List<ProductVO> vos = service.selectAll();
		log.info("vos:{}", vos);
		
		model.addAttribute("vos", vos);

		return ".product/selectAll";
	}
	
	@RequestMapping(value = "/pr_selectCategory.do", method = RequestMethod.GET)
	public String pr_selectCategory(ProductVO vo,Model model) {
		log.info("/pr_selectCategory.do....{}",vo);

		List<ProductVO> cvos = service.selectCategory(vo);
		log.info("cvos:{}", cvos);
		
		model.addAttribute("cvos", cvos);

		return ".product/categoryselect";
	}
	
	
	
	
	@RequestMapping(value = "/pr_selectOne.do", method = RequestMethod.GET)
	public String pr_selectOne(ProductVO vo,Model model) {
		log.info("/pr_selectOne.do.....");
		
		CartVO cvo = new CartVO();
		cvo.setNum(vo.getNum());
		model.addAttribute("cvo", cvo);
		log.info("cvo:{}",cvo);
		
		ReviewVO rvo = new ReviewVO();
		rvo.setNum(vo.getNum());
		List<ReviewVO> rvos = reviewService.selectAllTotal(rvo);
		log.info("rvos:{}",rvos);
		model.addAttribute("rvos",rvos);

		
		ProductVO vo2 = service.selectOne(vo);
		log.info("vo2:{}",vo2);
		model.addAttribute("vo2",vo2);
		
		
		return ".product/selectOne";
	}
	
	@RequestMapping(value = "/pr_searchList.do", method = RequestMethod.GET)
	public String pr_searchList(String searchKey, String searchWord,Model model) {
		log.info("/pr_searchList.do.....");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);

		List<ProductVO> vos = service.searchList(searchKey, searchWord);

		model.addAttribute("vos",vos);

		return ".product/selectAll";
	}
	
	
	@RequestMapping(value = "/pr_insert.do", method = RequestMethod.GET)
	public String pr_insert() {
		
		log.info("/pr_insert.do.....");

		return ".product/insert";
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
			return "redirect:productDetail.do";
		}else {
			return "redirect:pr_insert.do";
		}
		
	}
	
	@RequestMapping(value = "/pr_update.do", method = RequestMethod.GET)
	public String pr_update(ProductVO vo, Model model) {
		log.info("/pr_update.do...vo:{}",vo);
		
	
		
		ProductVO vo2 = service.selectOne(vo);
		log.info(vo2.toString());
		
		model.addAttribute("vo2",vo2);
		
		return ".product/update";
	}
	
	@RequestMapping(value = "/pr_updateOK.do", method = RequestMethod.POST)
	public String pr_updateOK(ProductVO vo) throws IllegalStateException, IOException{
		log.info("/pr_updateOK.do...{}",vo);
		
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
		

		int result = service.update(vo);
		log.info("result:{}",result);
		
		if(result==1) {
			return "redirect:pr_selectOne.do?num="+vo.getNum();
		}else {
			return "redirect:pr_update.do?num="+vo.getNum();
		}
		
	}
	
	@RequestMapping(value = "/pr_deleteOK.do", method = RequestMethod.GET)
	public String pr_deleteOK(ProductVO vo,Model model) {
		log.info("/pr_deleteOK.do...vo:{}",vo);
		
		
		int result = service.delete(vo);
		log.info("result:{}",result);
		
		model.addAttribute("result",result);
		
		
		if(result==1) {
			return "redirect:productDetail.do";
		}else {
			return "redirect:pr_selectOne.do?num="+vo.getNum();
		}
	}
	
	@RequestMapping(value = "/adminpage.do", method = RequestMethod.GET)
	public String adminpage(Model model) {
		log.info("/adminpage.do.....");


		return ".product/adminpage";
	}
	
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	public String productDetail(Model model) {
		
		log.info("/productDetail.do.....");
		List<ProductVO> vos = service.selectAll();
		log.info("vos:{}", vos);
		
		model.addAttribute("vos", vos);

		return ".product/productDetail";
	}
	
	
}//end class
