package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> bookList();

    Boolean addBook(Book book);

    boolean deleteBook(int id);

    boolean updateBook(Book book);

    List<Book> searchBook(String title);

    Book findBookById(int id);
}
