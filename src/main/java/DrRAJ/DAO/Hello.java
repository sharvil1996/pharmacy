package DrRAJ.DAO;

import java.util.ArrayList;

import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import DrRAJ.Bean.ProductBean;

public class Hello {

/*	@Produces("application/json")
	public Response genrateJSON() {
		ArrayList<ProductBean> arrayList = (ArrayList<ProductBean>) new ProductDAO().getList();
		return Response.ok(arrayList).build();
	}

	public static void main(String[] args) {
		
		ArrayList<ProductBean> arrayList = (ArrayList<ProductBean>) new Hello().genrateJSON().getEntity();
		
		System.out.println(arrayList.get(0).getProductName());
		
		System.out.println(new Hello().genrateJSON().getEntity());
	}
*/
}
