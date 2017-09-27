package com.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

import twitter4j.Location;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.ResponseList;
import twitter4j.Status;
import twitter4j.Trends;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public String contactus() {
		return "contact";
	}
	
	@RequestMapping(value = "/loadtweets", method = RequestMethod.GET)
	public void loadtweets(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Twitter twitter = new TwitterFactory().getInstance();
		AccessToken a = new AccessToken("140854111-xY5oJvE02BX4QDnArFLRDqGgL83vsELAOaYDsrM7",
				"DuHm822NBe3dJ8cfw9kzqcxX9l2OauXCj48r9MVHaA4zG");
		twitter.setOAuthConsumer("hqfuS38GQVrYeBjihrKogbEDQ", "WUltUN0Wkzm4zALYaWtEtzt8zDOIDTObTCMlBHugrIEm2msX9W");
		twitter.setOAuthAccessToken(a);
		String searchTweets = request.getParameter("searchTweets");
		Query query = new Query(searchTweets);
		query.count(100);
		try {
			QueryResult result = twitter.search(query);
			PrintWriter out = response.getWriter();
			ArrayList<Status> statusList = new ArrayList<Status>();
			for (Status status : result.getTweets()) {
				statusList.add(status);
			}
			Gson gson = new GsonBuilder().create();
			JsonArray arraylist = gson.toJsonTree(statusList).getAsJsonArray();
			//arraylist.get(0).getAsJsonObject().addProperty("Emotions", 1);
			//System.out.println(" This is it "+arraylist.get(0));
			out.println(arraylist);
			
			/*NLP.init();
			System.out.println(" This is death : " +NLP.findSentiment("Death"));*/
			
		} catch (TwitterException e) {
			System.out.println("Error Message :" + e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			System.out.println("Error Message :" + e.getMessage());
		}

	}
	
	@RequestMapping(value = "/twittertrends", method = RequestMethod.GET)
	public void twittertrends(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Indisde");	
		Twitter twitter = new TwitterFactory().getInstance();
			AccessToken a = new AccessToken("140854111-xY5oJvE02BX4QDnArFLRDqGgL83vsELAOaYDsrM7",
					"DuHm822NBe3dJ8cfw9kzqcxX9l2OauXCj48r9MVHaA4zG");
			twitter.setOAuthConsumer("hqfuS38GQVrYeBjihrKogbEDQ", "WUltUN0Wkzm4zALYaWtEtzt8zDOIDTObTCMlBHugrIEm2msX9W");
			twitter.setOAuthAccessToken(a);
			try {
				ResponseList<Location> location  = twitter.getAvailableTrends();
				PrintWriter out = response.getWriter();
				
				Gson gson = new GsonBuilder().create();
				JsonArray arraylist = gson.toJsonTree(location).getAsJsonArray();
				
				System.out.println(arraylist);
				out.println(arraylist);
			} catch (TwitterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	@RequestMapping(value = "/gettrendsbycountry", method = RequestMethod.GET)
	public void gettrendsbycountry(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int woeid = Integer.parseInt(request.getParameter("woeid"));
		System.out.println("Woeid :" + woeid);	
		Twitter twitter = new TwitterFactory().getInstance();
			AccessToken a = new AccessToken("140854111-xY5oJvE02BX4QDnArFLRDqGgL83vsELAOaYDsrM7",
					"DuHm822NBe3dJ8cfw9kzqcxX9l2OauXCj48r9MVHaA4zG");
			twitter.setOAuthConsumer("hqfuS38GQVrYeBjihrKogbEDQ", "WUltUN0Wkzm4zALYaWtEtzt8zDOIDTObTCMlBHugrIEm2msX9W");
			twitter.setOAuthAccessToken(a);
			try {
				Trends trend = twitter.getPlaceTrends(woeid);
				System.out.println("This is :"+trend);
				System.out.println("This is :"+trend.getTrends());
				PrintWriter out = response.getWriter();
				Gson gson = new GsonBuilder().create();
				JsonArray arraylist = gson.toJsonTree(trend.getTrends()).getAsJsonArray();
				System.out.println("This is :"+arraylist);
				out.println(arraylist);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
}
