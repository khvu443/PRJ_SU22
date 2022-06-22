
package Test;

import DAO.Dao;
import Model.Student;
import Model.Class;
import java.util.ArrayList;

public class Test {

    public static void main(String[] args) {
        Dao d = new Dao();
        ArrayList<Student> ls = d.getAllStudent();
        ArrayList<Class> ls1 = d.getAllClass();
        
        for(Student s : ls)
        {
            System.out.println("St" + s.toString());
        }
        
        for(Class s : ls1)
        {
            System.out.println("Class" + s.toString());
        }
    }

}
