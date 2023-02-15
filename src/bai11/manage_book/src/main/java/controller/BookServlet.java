package controller;

import model.Book;
import service.IBookService;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookServlet", urlPatterns = "/book")
public class BookServlet extends HttpServlet {
    IBookService bookService = new BookService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createBook(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                break;
            case "edit":
                updateBook(request, response);
            case "search":
                searchBook(request, response);
        }
    }

    private void searchBook(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        request.setAttribute("bookList", bookService.searchBookByTitle(title));
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book book = new Book(id, title, pageSize, author, category);
        boolean flag = bookService.updateBook(book);
        String mess = "Sửa thành công";
        if (flag) {
            request.setAttribute("mess", mess);
        } else {
            mess = "thất bại";
            request.setAttribute("mess", mess);
        }
        try {
            request.getRequestDispatcher("view/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String mess = "Xóa Không thành công";
        boolean check = bookService.deleteBook(id);
        if (check) {
            mess = "Xóa Thành công";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        bookService.addBook(new Book(title, pageSize, author, category));
        showList(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("book", bookService.findBookById(id));
        try {
            request.getRequestDispatcher("/view/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("bookList", bookService.bookList());
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
