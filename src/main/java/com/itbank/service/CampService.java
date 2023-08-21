package com.itbank.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.repository.CampDAO;

@Service
public class CampService {

	@Autowired private CampDAO campDAO;
	private String serviceKey = "NXleNIUe%2Fm77zJ9SgvX9%2BmbB2KiHMu900jEu%2F1GCGQ%2F3eOQD65jRFFN5l5Qrvw5tumPP0dCi%2BjK75haSrtR9IA%3D%3D";
	private String pageNo = "1";
	private String numOfRows = "50";
	private String _type = "json";
	private String MobileOS = "ETC";
	private String MobileApp = "AppTest";
	
	public int selectCnt(SearchDTO search) {
		return campDAO.selectCnt(search);
	}
	
	public List<ItemDTO> selectAll(PageAndSearchDTO searchPage) {
		return campDAO.selectAll(searchPage);
	}

	public String selectId(String contentId) {
		return campDAO.selectId(contentId);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> requestAPI(String contentId, String camp) throws IOException{
		Map<String, Object> returnParams = new HashMap<>();

		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/GoCamping/searchList?");
		urlBuilder.append("serviceKey=" + serviceKey + "&");
		urlBuilder.append("numOfRows=" + URLEncoder.encode(numOfRows, "UTF-8") + "&");
		urlBuilder.append("pageNo=" + URLEncoder.encode(pageNo, "UTF-8") + "&");
		urlBuilder.append("MobileOS=" + URLEncoder.encode(MobileOS, "UTF-8") + "&");
		urlBuilder.append("MobileApp=" + URLEncoder.encode(MobileApp, "UTF-8") + "&");
		urlBuilder.append("keyword=" + URLEncoder.encode(camp, "UTF-8") + "&");		
		urlBuilder.append("_type=" + URLEncoder.encode(_type, "UTF-8"));		
		
//		System.out.println(urlBuilder.toString());
		
		URL requestURL = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
		conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
        	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        }
        else {
        	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
//        System.out.println(rd.toString());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
        	sb.append(line);
        }      
        rd.close();
        conn.disconnect();
//        System.out.println(sb.toString());
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();
        map = objectMapper.readValue(sb.toString(), new TypeReference <Map<String,Object>>() {});
        Map<String, Object> response = (Map<String, Object>) map.get("response");
        Map<String, Object> body = (Map<String, Object>) response.get("body");
        Map<String, Object> items = (Map<String, Object>) body.get("items");
		List<Map<String,Object>> itemList = (List<Map<String, Object>>) items.get("item");
		
		if (itemList.size() > 1) {
	        for (Map<String, Object> item : itemList) {
	        	if (item.get("contentId").equals(contentId)) {
	        		returnParams = item;
	        	}
	        }
		}
		else {
			returnParams = itemList.get(0);
		}
		
		return returnParams;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> requestAPI(String contentId) throws IOException{
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/GoCamping/imageList?");
		urlBuilder.append("serviceKey=" + serviceKey + "&");
		urlBuilder.append("numOfRows=" + URLEncoder.encode(numOfRows, "UTF-8") + "&");
		urlBuilder.append("pageNo=" + URLEncoder.encode(pageNo, "UTF-8") + "&");
		urlBuilder.append("MobileOS=" + URLEncoder.encode(MobileOS, "UTF-8") + "&");
		urlBuilder.append("MobileApp=" + URLEncoder.encode(MobileApp, "UTF-8") + "&");
		urlBuilder.append("contentId=" + URLEncoder.encode(contentId, "UTF-8") + "&");		
		urlBuilder.append("_type=" + URLEncoder.encode(_type, "UTF-8"));		
		
		System.out.println(urlBuilder.toString());
		
		URL requestURL = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
		conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
        	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        }
        else {
        	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
//        System.out.println(rd.toString());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
        	sb.append(line);
        }      
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();
        map = objectMapper.readValue(sb.toString(), new TypeReference <Map<String,Object>>() {});
        Map<String, Object> response = (Map<String, Object>) map.get("response");
        Map<String, Object> body = (Map<String, Object>) response.get("body");
        if (body.get("items") == "") {
        	return null;
        }
        Map<String, Object> items = (Map<String, Object>) body.get("items");
        List<Map<String,Object>> itemList = (List<Map<String, Object>>) items.get("item");        	
        
		return itemList;
	}
}
