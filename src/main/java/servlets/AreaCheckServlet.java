package servlets;

import model.Model;
import point.Dot;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AreaCheckServlet extends HttpServlet {
    public Model model;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");

        HttpSession session = req.getSession();
        if(session.getAttribute("model") == null) {
            model = new Model();
        } else {
            model = (Model)session.getAttribute("model");
        }

        try {
            if (!(tryToParse(req.getParameter("x")) && (tryToParse(req.getParameter("Xgr"))))) {
                if (tryToParse(req.getParameter("x"))) {
                    //Если нажата кнопка
                    checkButton(req,resp);
                } else if (tryToParse(req.getParameter("Xgr"))) {
                    //если пришло по нажатию на график
                    checkGraphic(req,resp);
                } else {
                    createErrorPage(resp, "Please no...oooh_ i can't find X or Xgr");
                }

            } else {
                createErrorPage(resp, "Please no...oooh");
            }

        } catch (Exception e) {

        }

    }


    public void checkButton(HttpServletRequest req, HttpServletResponse resp) throws IOException {


        double scale = Math.pow(10, 4);
        String res = "";
        Double x = Math.ceil(Double.parseDouble(req.getParameter("x")) * scale) / scale;
        Double y = Math.ceil(Double.parseDouble(req.getParameter("Y")) * scale) / scale;
        Double r = Math.ceil(Double.parseDouble(req.getParameter("R")) * scale) / scale;

        if(((x==-3)||(x==-2)||(x==-1)||(x==0)||(x==1)||(x==2)||(x==3)||(x==4)||(x==5))&&(y>=-5)&&(y<=3)&&(r>=1)&&(r<=4)){
            if(zona(x,y,r)){
                res = "True";
                model.setDot(new Dot(x,y,r,true));

            }else {
                res = "False";
                model.setDot(new Dot(x,y,r,false));
            }
            drawTable(resp,x.toString(),y.toString(),r.toString(),res);
        }else {
          createErrorPage(resp,"error!");
        }

        HttpSession session = req.getSession();
        session.setAttribute("model", model);


    }

    public void checkGraphic(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        double scale = Math.pow(10, 4);
        String res = "";
        Double x = Math.ceil(Double.parseDouble(req.getParameter("Xgr")) * scale) / scale;
        Double y = Math.ceil(Double.parseDouble(req.getParameter("Y")) * scale) / scale;
        Double r = Math.ceil(Double.parseDouble(req.getParameter("R")) * scale) / scale;

        if((r>=1)&&(r<=4)){
            if(zona(x,y,r)){
                res = "True";
                model.setDot(new Dot(x,y,r,true));

                try {
                    for (int i = 0; i < model.Dots.size(); i++) {
                        res+= (model.Dots.get(i).toString());

                    }
                    drawTable(resp,x.toString(),y.toString(),r.toString(),res);
                }catch (Exception e){
                    drawTable(resp,x.toString(),y.toString(),r.toString(),res);
                }
              //drawTable(resp,x.toString(),y.toString(),r.toString(),res);

            }else {
                res = "False";
                model.setDot(new Dot(x,y,r,false));
                drawTable(resp,x.toString(),y.toString(),r.toString(),res);

            }

        }else {
            createErrorPage(resp,"error!");
        }
    }

    public void drawTable(HttpServletResponse resp, String x, String y, String r, String otv) throws IOException {

        PrintWriter writer = resp.getWriter();
        String answer = "<html>\n" +
                "  <head>\n" +
                "    <meta charset=\"utf-8\" /> " +
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/error.css\">" +
                "  </head>" +
                "<body>" +
                "<div id = \"error\"> X =  " + x + "</div>" +
                "<div id = \"error2\"> Y =  " + y + "</div>" +
                "<div id = \"error3\"> R =  " + r + "</div>" +
                "<div id = \"error3\"> Result ->  " + otv + "</div>" +
                "<a href = \"http://localhost:8080/WebLab2_war_exploded\">Go back</a>" +
                "</body></html>";
        writer.write(answer);
        writer.close();
    }


    public void createErrorPage(HttpServletResponse resp, String text) throws IOException {
        PrintWriter writer = resp.getWriter();
        String answer = "<html>\n" +
                "  <head>\n" +
                "    <meta charset=\"utf-8\" /> " +
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/error.css\">" +
                "  </head>" +
                "<body>" +
                "<div id = \"error\">Error " + text + "</div>" +
                "<a href = \"http://localhost:8080/WebLab2_war_exploded\">Go back</a>" +
                "</body></html>";
        writer.write(answer);
        writer.close();
    }

    private boolean tryToParse(String s) {
        try {
            Double.parseDouble(s);
            return true;
        } catch (NumberFormatException | NullPointerException ex) {
            return false;
        }
    }



    public boolean zona(Double x, Double y, Double r){
        boolean res = false;
        if ((x<0)&&(y>=0)&&(x>(-r)&&(y<r/2)) ||
                (((x*x + y*y)<=r*r)&&(y<=0)&&(x<=0))||((y>(x/2-r/2))&&(y<=0)&&(x>0)&&x<=r)
        ){
            res = true;
        }
        return res;
    }
}
