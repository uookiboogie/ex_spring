<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">홈 입니다용</h1>
                        <%=application.getMajorVersion()%>
                        <%=application.getMinorVersion()%>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
 
 <%@ include file="/WEB-INF/views/includes/footer.jsp"%>