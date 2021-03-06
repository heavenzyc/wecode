package com.wecode.framework.util.url;

import static org.junit.Assert.*;

import junit.framework.Assert;

import org.junit.Test;

public class URLTest {

  @Test
  public void testURL() throws Exception {

    // build a URL
    URL u = new URL("http://www.shopobot.com/?search=ipod");

    // check the parts of the url were set correctly
    assertEquals(u.getProtocol().name(), "http");

    u.setFragment("login");
    assertEquals(u, "http://www.shopobot.com/?search=ipod#login");

    // add a parameter
    u.addParameter("abc", "123");
    assertEquals(u, "http://www.shopobot.com/?search=ipod&abc=123#login");

    // add a duplicate parameter
    u.addParameter("abc", "456");
    assertEquals(u, "http://www.shopobot.com/?search=ipod&abc=123&abc=456#login");

    // remove a parameter
    u.removeParameter("search");
    assertEquals(u, "http://www.shopobot.com/?abc=123&abc=456#login");

    // reset fragment
    u.setFragment("");
    assertEquals(u, "http://www.shopobot.com/?abc=123&abc=456");

    // test an encoded paramter
    u.addParameter("encoding", "this code = awesome!");
    assertEquals(u, "http://www.shopobot.com/?abc=123&abc=456&encoding=this+code+%3D+awesome%21");

    // remove both duplicate parameters
    u.removeParameter("abc");
    assertEquals(u, "http://www.shopobot.com/?encoding=this+code+%3D+awesome%21");

    // change host and port
    u.setHost("localhost").setPort(8080);
    assertEquals(u, "http://localhost:8080/?encoding=this+code+%3D+awesome%21");

    // remove a parameter and add a page number (int parameter)
    u.removeParameter("encoding").addParameter("page", 2);
    assertEquals(u, "http://localhost:8080/?page=2");

    // set the path
    u.setPath("electronics/");
    assertEquals(u, "http://localhost:8080/electronics/?page=2");
    u.setPath("/electronics/");
    assertEquals(u, "http://localhost:8080/electronics/?page=2");
    
    // increment a parameter 3 times
    u.incrementParameter("page").incrementParameter("page").incrementParameter("page");
    assertEquals(u, "http://localhost:8080/electronics/?page=5");
    // make sure the correct page number is returned
    assertEquals(u.getParameter("page", 1), 5);

    // set the page number to 2 and remove it -- setting it to 1
    // since 1 is considered default, it is removed completely
    u.setParameter("page", 2).decrementParameter("page");
    assertEquals(u, "http://localhost:8080/electronics/");

    // make sure that page will not be decremented since we're at 1
    u.decrementParameter("page");
    assertEquals(u, "http://localhost:8080/electronics/");
    
    // test that defaults work
    assertEquals(u.getParameter("page", 1), 1);
    assertEquals(u.getParameter("page", 10), 10);
    
    // test relative paths
    u.setPath("/electronics/photography/");
    assertEquals(u.toStringRelative(new URL("http://localhost:8080/")), "electronics/photography/");
    assertEquals(u.toStringRelative(new URL("http://localhost:8080/electronics/")), "photography/");
    assertEquals(u.toStringRelative(new URL("http://localhost:8080/electronics/photography/")), "");
    assertEquals(u.toStringRelative(new URL("http://localhost:8080/electronics/mp3-players/")), "../photography/");
    // make sure when paths match, but authority doesn't results in full url return
    assertEquals(u.toStringRelative(new URL("http://www.shopobot.com/electronics/photography/")), "http://localhost:8080/electronics/photography/");
    assertEquals(u.toStringRelative(new URL("http://localhost:80/electronics/photography/")), "http://localhost:8080/electronics/photography/");
    assertEquals(u.toStringRelative(new URL("https://localhost:8080/electronics/photography/")), "http://localhost:8080/electronics/photography/");
    
    // try some more complicated relative paths
    u.setHost("x.com").setPath("/a/b/c/d/e.html").setPort(80);
    assertEquals(u.toStringRelative(new URL("http://x.com/")),"a/b/c/d/e.html");
    assertEquals(u.toStringRelative(new URL("http://x.com/a/b")),"c/d/e.html");
    assertEquals(u.toStringRelative(new URL("http://x.com/a/b?q=1")),"/a/b/c/d/e.html");
    u.addParameter("q", 1);
    assertEquals(u.toStringRelative(new URL("http://x.com/a/b/c/d/e.html")),"?q=1");
    assertEquals(u.toStringRelative(new URL("http://x.com/a/b/c/d/e/f/g/h")),"../../../../e.html?q=1");
    assertEquals(u.toStringRelative(new URL("x.com/x/y/z/")),"../../../a/b/c/d/e.html?q=1");
    assertEquals(u.toStringRelative(new URL("x.com/a/b/c/d/x/y/e.html")),"../../../e.html?q=1");
    u.addParameter("f", "a b c");
    assertEquals(u.toStringRelative(new URL("x.com/a/b/c/d/x/y/e.html")),"../../../e.html?q=1&f=a+b+c");
    u.setFragment("hello").removeParameter("f");
    assertEquals(u.toStringRelative(new URL("x.com/a/b/c/d/x/y/e.html")),"../../../e.html?q=1#hello");
    assertEquals(u.toStringFull(),"/a/b/c/d/e.html?q=1#hello");
    
    //test parameters with relative paths
    u = new URL("facebook.com");
    u.addParameter("test", "hi");
    assertEquals(u.toStringRelative(new URL("facebook.com/?test=hi")),"");
    assertEquals(u.toStringRelative(new URL("facebook.com/?test=hi&hello=hey")),"?test=hi");
    u.addParameter("hello", "hey");
    assertEquals(u.toStringRelative(new URL("facebook.com/?test=hi&hello=hey")),"");
    assertEquals(u.toStringRelative(new URL("facebook.com/?test=hi&hello=hey#wow")),"?test=hi&hello=hey");
    assertEquals(u.toStringRelative(new URL("facebook.com/")),"?test=hi&hello=hey");
    assertEquals(u.toStringRelative(new URL("facebook.com/#yo")),"?test=hi&hello=hey");
    u = new URL("facebook.com/#yo");
    assertEquals(u.toStringRelative(new URL("facebook.com/")),"#yo");
    
    //test relative paths with parameter changes
    u = new URL("example.com/?param=1");
    assertEquals(u.toStringRelative(new URL("example.com/?param=2")),"?param=1");
    u = new URL("example.com/?param=1&param=2");
    assertEquals(u.toStringRelative(new URL("example.com/?param=1&param=4")),"?param=1&param=2");
    u.removeParameter("param");
    assertEquals(u.toStringRelative(new URL("example.com/?param=1&param=4")),"/");
    
    // build a new URL to test empty and null parameter values
    u = new URL("http://www.google.com/");
    u.addParameter("test", "");
    assertEquals(u, "http://www.google.com/?test");
    assertEquals(u.getParameter("test", "this is not returned"), "");
    u.addParameter("this is a test", null);
    assertEquals(u, "http://www.google.com/?test&this+is+a+test");
    u.addParameter("", "");
    assertEquals(u, "http://www.google.com/?test&this+is+a+test");    
    u.addParameter(null, "");
    assertEquals(u, "http://www.google.com/?test&this+is+a+test");
    u.addParameter("", null);
    assertEquals(u, "http://www.google.com/?test&this+is+a+test");
    u.addParameter(null, null);
    assertEquals(u, "http://www.google.com/?test&this+is+a+test");
    u.removeParameter("this is a test");
    assertEquals(u, "http://www.google.com/?test");
    u.removeParameter("");
    assertEquals(u, "http://www.google.com/?test");
    String[] nullGuy = null;
    u.removeParameter(nullGuy);
    assertEquals(u, "http://www.google.com/?test");
    u.removeParameter("test");
    assertEquals(u, "http://www.google.com/");
    u.addParameter(" "," ");
    assertEquals(u, "http://www.google.com/?+=+");
    u.addParameter("+","+");
    assertEquals(u.getParameter("+", ""), "+");
    assertEquals(u, "http://www.google.com/?+=+&%2B=%2B");
    u.removeParameter(" ").removeParameter("+");
    assertEquals(u, "http://www.google.com/");
    
    //test fragment encoding
    u.setFragment("short");
    assertEquals(u, "http://www.google.com/#short");
    assertEquals(u.getFragment(),"short");
    u.setFragment("/this/is/a/#/<long>/( fragment )/");
    assertEquals(u, "http://www.google.com/#/this/is/a/%23/%3Clong%3E/(+fragment+)/");
    u.setFragment(null);
    assertEquals(u, "http://www.google.com/");
    
    u = new URL("www.wikipedia.org/wiki/USA");
    assertEquals(u.matchesAuthority("org"), true);
    assertEquals(u.matchesAuthority(".org"), true);
    assertEquals(u.matchesAuthority("pedia.com"), false);
    assertEquals(u.matchesAuthority("wikipedia.org"), true);
    assertEquals(u.matchesAuthority("uwikipedia.org"), false);
    assertEquals(u.matchesAuthority(".wikipedia.org"), true);
    assertEquals(u.matchesAuthority("en.wikipedia.org"), false);
    u.setHost("sub.en.wiki.com");
    assertEquals(u.matchesAuthority("com"), true);
    assertEquals(u.matchesAuthority("wiki.com"), true);
    assertEquals(u.matchesAuthority("en.wiki.com"), true);
    assertEquals(u.matchesAuthority("sub.en.wiki.com"), true);
    assertEquals(u.matchesAuthority("asub.en.wiki.com"), false);
    assertEquals(u.matchesAuthority("a.sub.en.wiki.com"), false);
    assertEquals(u.matchesAuthority("sub.en.wiki.com","asub.en.wiki.com"), true);
    assertEquals(u.matchesAuthority("a.sub.en.wiki.com","asub.en.wiki.com"), false);
    
    //test no protocol on factory style methods
    u = URL.get("www.wikipedia.org/wiki/USA");
    u = URL.get("www.wikipedia.org/wiki/USA", u);
    
    u = new URL("shopobot.com");
    u.setParameter("will this <#> be encoded?","we've gone batshit crazy! seriously!");
    u.setFragment("what's our # again?");
    assertEquals(u.toString(),"http://shopobot.com/?will+this+%3C%23%3E+be+encoded%3F=we%27ve+gone+batshit+crazy%21+seriously%21#what's+our+%23+again?");
    assertEquals(u.getParameter("will this <#> be encoded?", ""), "we've gone batshit crazy! seriously!");
    assertEquals(u.getFragment(), "what's our # again?");
    
    u = new URL("www.en.shopobot.com");
    assertEquals(u.getAuthoritySize(), 4);
    assertEquals(u.getAuthority(-1),"");
    assertEquals(u.getAuthority(0),"");
    assertEquals(u.getAuthority(1),"com");
    assertEquals(u.getAuthority(2),"shopobot.com");
    assertEquals(u.getAuthority(3),"en.shopobot.com");
    assertEquals(u.getAuthority(4),"www.en.shopobot.com");
    assertEquals(u.getAuthority(5),"www.en.shopobot.com");
    
    u = new URL("en.wikipedia.org:90210/a/b/c/d/e.html?test=true");
    assertEquals(u.getChildDirectory("a"),"b");
    assertEquals(u.getChildDirectory("b"),"c");
    assertEquals(u.getChildDirectory("c"),"d");
    assertEquals(u.getChildDirectory("d"),"e.html");
    assertEquals(u.getChildDirectory("e.html"),"");
    assertEquals(u.getChildDirectory("g"),"");
    
    assertEquals(u.getParentDirectory("a"),"");
    assertEquals(u.getParentDirectory("b"),"a");
    assertEquals(u.getParentDirectory("c"),"b");
    assertEquals(u.getParentDirectory("d"),"c");
    assertEquals(u.getParentDirectory("e.html"),"d");
    assertEquals(u.getParentDirectory("e"),"");
    
    //bestbuy has the fugliest urls...
    u = new URL("http://www.bestbuy.com/site/Apple&%23174%3B+-+iPod+classic&%23174%3B+160GB*+MP3+Player+-+Silver/8771965.p?id=1204332254084&skuId=8771965&cmp=RMX&ref=06&loc=01&ci_src=14110944&ci_sku=8771965");
    assertEquals(u.getPath(),"/site/Apple&%23174%3B+-+iPod+classic&%23174%3B+160GB*+MP3+Player+-+Silver/8771965.p");
    
    //buy.com has funny click throughs...
    u = new URL("http://clickfrom.buy.com/default.asp?adid=17902&sURL=http%3A%2F%2Fwww.buy.com%2Fpr%2Fproduct.aspx%3Fsku%3D217203063%26sellerid%3D20676510");
    assertEquals(u.getParameter("sURL", ""),"http://www.buy.com/pr/product.aspx?sku=217203063&sellerid=20676510");
    
    //test relative url creation
    u = new URL("http://www.example.com");
    URL u2 = u.resolveRelative("q.html");
    assertEquals(u2.toString(), "http://www.example.com/q.html");
    u2 = u.resolveRelative("/q.html");
    assertEquals(u2.toString(), "http://www.example.com/q.html");
    u = new URL("http://www.example.com/abc/");
    u2 = u.resolveRelative("q.html");
    assertEquals(u2.toString(), "http://www.example.com/abc/q.html");
  }
  
  @Test
  public void testExceptions() throws Exception {
    
    try {
      String nullString = null;
      new URL(nullString);
      Assert.fail("NullPointerException expected");
    } catch (NullPointerException e) {
      //correct
    }
    
    try {
      new URL("htxp://www.google.com");
      Assert.fail("IllegalArgumentException expected");
    } catch (IllegalArgumentException e) {
      //correct
    }
    
    try {
      URL u = new URL("http://www.google.com");
      u.setProtocol("xttp");
      Assert.fail("IllegalArgumentException expected");
    } catch (IllegalArgumentException e) {
      //correct
    }
    
    try {
      new URL("");
      Assert.fail("IllegalArgumentException expected");
    } catch (IllegalArgumentException e) {
      //correct
    }
        
  }
}
