<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
com.niit.hiberannotations.Address,
com.niit.hiberannotations.Employee,
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
Employee e1=new Employee();    
e1.setName("Abhishek Singh Chouhan");    
e1.setEmail("abhi@gmail.com");    
    
Address address1=new Address();    
address1.setAddressLine1("Lalitpur");    
address1.setCity("Jhansi");    
address1.setState("Uttar Pradesh");    
address1.setCountry("India");    
address1.setPincode(560042);    
    
e1.setAddress(address1);    
address1.setEmployee(e1);    
    
sess.persist(e1);    
t.commit();    
    
sess.close();    
out.println("successfully Saved"); 
%>
</body>
</html>