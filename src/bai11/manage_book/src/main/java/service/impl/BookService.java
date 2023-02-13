package service.impl;

import model.Book;
import repository.IBookRepository;
import repository.impl.BookRepository;
import service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    IBookRepository bookRepository = new BookRepository();

    @Override
    public List<Book> bookList() {
        return bookRepository.bookList();
    }

    @Override
    public Boolean addBook(Book book) {
        return bookRepository.addBook(book);
    }

    @Override
    public boolean deleteBook(int id) {
        bookRepository.deleteBook(id);
        return false;
    }

    @Override
    public boolean updateBook(Book book) {
        return bookRepository.updateBook(book);
    }

    @Override
    public List<Book> searchBook(String title) {
        return null;
    }

    @Override
    public Book findBookById(int id) {
        return bookRepository.findBookById(id);
    }
}
