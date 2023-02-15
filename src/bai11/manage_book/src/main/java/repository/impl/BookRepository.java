package repository.impl;

import model.Book;
import repository.BaseRepository;
import repository.IBookRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String FIND_ALL = "select * from book";
    private static final String INSERT_INTO = "call add_book(?,?,?,?)";
    private final String DELETE_USER = "call delete_book(?);";
    private static final String UPDATE_USERS_SQL = "update book set title = ?,pageSize= ?, author =?,category=? where id = ?;";
    private static final String FIND_BY_ID = "select * from book where id=?";
    private static final String FIND_BY_TITLE = "select * from book where title like ?";

    @Override
    public List<Book> bookList() {
        List<Book> bookList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                Book book1 = new Book(id, title, pageSize, author, category);
                bookList.add(book1);
            }
            resultSet.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }

    @Override
    public Boolean addBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_INTO);

            callableStatement.setString(1, book.getTitle());
            callableStatement.setInt(2, book.getPageSize());
            callableStatement.setString(3, book.getAuthor());
            callableStatement.setString(4, book.getCategory());

            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteBook(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getPageSize());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setString(4, book.getCategory());
            preparedStatement.setInt(5, book.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Book> searchBookByTitle(String title) {
        List<Book> bookList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_TITLE);
            preparedStatement.setString(1, "%" + title + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String titleBook = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                bookList.add(new Book(id, titleBook, pageSize, author, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }

    @Override
    public Book findBookById(int id) {
        Connection connection = BaseRepository.getConnection();
        Book book = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String titleBook = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                book = new Book(id, titleBook, pageSize, author, category);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return book;
    }
}
