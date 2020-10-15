package model;

import java.util.ArrayList;

public class Model {

    public static ArrayList<Point> points = new ArrayList<>();

    public void setPoint(Point point){
        points.add(point);
    }

    public ArrayList<Point> getPoint() {
        return points;
    }
}
