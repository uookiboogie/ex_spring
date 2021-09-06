<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/dist/js/sb-admin-2.js"></script>

<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board 상세보기
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="modify" method="post">
                                        <div class="form-group">
                                            <label>bno</label>
                                            <input class="form-control" name="bno" value="${board.bno}" readonly>
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name="title" value="${board.title}">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Writer</label>
                                            <input class="form-control" name="writer" value ="${board.writer}">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="3" name="content">${board.content}</textarea>
                                        </div>
<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/>

										  <input type="hidden" name="pageNum" value="${cri.pageNum}">
										  <input type="hidden" name="amount" value="${cri.amount}">

                                        <button type="submit" class="btn btn-default">수정하기</button>
                                        <button type="submit" class="btn btn-danger" formaction="delete">삭제하기</button>
                                        <a type="button" class="btn btn-success" href="list?pageNum=${cri.pageNum }&amount=${cri.amount}">목록으로</a>
                                    </form>                  
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
    
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>