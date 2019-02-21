package model;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MainModel {
	public String exec(HttpServletRequest request, HttpServletResponse response);
}
