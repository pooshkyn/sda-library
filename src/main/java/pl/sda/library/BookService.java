package pl.sda.library;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

import java.util.List;
import java.util.stream.Collectors;

public class BookService {

    static {
        saveBook(new Book("Harry Potter", "J.K. Rowling", false, "testuser"));
        saveBook(new Book("Thinking in Java", "R. Eckel", true, null));
        saveBook(new Book("Ogniem i mieczem", "H. Sienkiewicz", true, null));
        saveBook(new Book("Pan Tadeusz", "A. Mickiewicz", false, "jan"));
    }

    public static List<Book> getAll() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        return session.createQuery("SELECT a FROM Book a").list();
    }

    public static Book getOne(int id) {
        try {
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session session = sessionFactory.openSession();
            return (Book) session.get(Book.class, id);
        } catch (Throwable ex) {
            throw new RuntimeException("Błąd przy pobraniu książki", ex);
        }
    }

    public static void rentBook(int id, String userLogin) {
        Book book = getOne(id);
        book.setAvailable(false);
        book.setUserLogin(userLogin);
        saveBook(book);
    }

    public static void returnBook(int id) {
        Book book = getOne(id);
        book.setAvailable(true);
        book.setUserLogin(null);
        saveBook(book);
    }

    public static void saveBook(Book book) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        if (book.getId() == null) {
            session.save(book);
        } else {
            session.update(book);
        }
        session.getTransaction().commit();
    }
}
