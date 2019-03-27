<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
com.niit.hiberannotations.Answer,
com.niit.hiberannotations.Question,
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
<h1>Hibernate One To Many Annotation Example</h1>
<%

Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf=cfg.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess=sf.openSession();
Transaction t=sess.beginTransaction();

//t.begin();

Answer ans1=new Answer();
ans1.setAnswername("Hibernate is ORM Tool");
ans1.setPostedBy("Bharat Bauhara");

Answer ans2=new Answer();
ans2.setAnswername("Java follows OOP'S Concept");
ans2.setPostedBy("Abhi Chouhan");

Answer ans3=new Answer();
ans3.setAnswername("Stream does not store data");
ans3.setPostedBy("Annu Das");

Answer ans4=new Answer();
ans4.setAnswername("recent technolgoy is Spring Framework");
ans4.setPostedBy("Vivek Kumar");

ArrayList<Answer> list1=new ArrayList<Answer>();
list1.add(ans1);
list1.add(ans2);
ArrayList<Answer> list2=new ArrayList<Answer>();
list2.add(ans3);
list2.add(ans4);

Question question1=new Question();
question1.setQname("What is Hibernate and java");
question1.setAnswers(list1);
Question question2=new Question();
question2.setQname("What are strream and recent tech");
question2.setAnswers(list2);

sess.persist(question1);
sess.persist(question2);

t.commit();


out.println("Table Created & Record successfully Inserted");

out.println("**************Display Data******************");
TypedQuery query=sess.createQuery("from Question");
List<Question> list=query.getResultList();

Iterator<Question> itr=list.iterator();
while(itr.hasNext())
{
	Question q=itr.next();
	out.println("Question Name :"+q.getQname());

	List<Answer> list3=q.getAnswers();
	Iterator<Answer> itr2=list3.iterator();
	while(itr2.hasNext())
	{
		Answer a=itr2.next();
		out.println(a.getAnswername()+":"+a.getPostedBy());
	}
	out.println("<br>");
}
sess.close();
out.println("success");

%>
</body>
</html>