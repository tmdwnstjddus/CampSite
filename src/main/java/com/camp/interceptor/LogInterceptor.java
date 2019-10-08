package com.camp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//public class LogInterceptor implements HandlerInterceptor {
public class LogInterceptor extends HandlerInterceptorAdapter {
   
   //컨트롤러의 메서드를 호출하기 전
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      log.debug("=============== BEGIN ================");
      return super.preHandle(request, response, handler);
   }


   //컨트롤러의 메서드를 호출한 후
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

      log.debug("=================end");
      super.postHandle(request, response, handler, modelAndView);
   }
}