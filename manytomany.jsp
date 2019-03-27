<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
com.niit.hiberannotations.Student,
com.niit.hiberannotations.Course,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder,javax.persistence.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess=sf.openSession();
Transaction t=sess.getTransaction();
t.begin();
Student s1=new Student();
s1.setStudentId(100);
s1.setStudentName("James");
s1.setMarks(98);

Student s2=new Student();
s2.setStudentId(101);
s2.setStudentName("Lee");
s2.setMarks(99);

Course c1=new Course();
c1.setCourseId(500);
c1.setCourseName("Hibernate");
c1.setDuration(7);

Course c2=new Course();
c2.setCourseId(501);
c2.setCourseName("Java");
c2.setDuration(30);

Set s =new HashSet();
      s.add(c1);
      s.add(c2);

s1.setCourses(s);
s2.setCourses(s);

	//sess.save(s1);
                      
//sess.save(s2);
sess.persist(s1);
sess.persist(s2);
t.commit();
sess.close();
%>
</body>
</html>