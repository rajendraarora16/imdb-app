<%
    if ((session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == ""))
    {
%>  
<%
		response.sendRedirect("./error");
	}
    else
%>
<%
	{
		String userName = (String)session.getAttribute("userName");
%>

<div class="navbar">
	<table>
    	<tr>
    		<td>
        		<div class="navbar-inner container" style="width: 195px;">
            		<div class="logo-box">
                   		<a href="index" class="logo-text"><span>IMDB </span></a>
            		</div>
            	</div>
            </td>
            <td>
            	<form action="search" method="post">
            		<div>
            			<table>
            				<tr>
            					<td>
            						<div>
            							<input type="text" style="width: 338px; height: 30px; padding: 5px; border: 1px solid rgb(245, 245, 245);" name="search" placeholder="Search Actors, Actress and Movies.." />
            						</div>
            					</td>
            					<td>
            						<div>
            							<button style="border: 0px none rgb(245, 245, 245); height: 30px; padding: 5px; width: 35px;"><i class="fa fa-search"></i></button>
            						</div>
            					</td>
            				</tr>
            			</table>           					
					</div>
            	</form>
            </td>
            <td>
            	<div style="margin-left: 30px; margin-top: 20px;">
            		<p>Hi <%=userName%>!</p>
            	</div>
            </td>
            <td>
            	<ul>
					<li class="dropdown">
    					<a aria-expanded="true" href="#" class="dropdown-toggle waves-effect waves-button waves-classic" style="font-size: 14px; margin-top: 15px;" data-toggle="dropdown">
        					<img class="img-circle avatar" src="./logo/avatar.png" alt="" width="40" height="40">
    					</a>
    					<ul class="dropdown-menu dropdown-list" role="menu">
        					<li role="presentation"><a href="profile"><i class="fa fa-user"></i>Profile (Rajendra Arora)</a></li>
        					<li role="presentation"><a href="addBio"><i class="fa fa-plus"></i>Add Actor/Actress Bio</a></li>
        					<li role="presentation"><a href="addMovies"><i class="fa fa-plus"></i>Add Movies</a></li>
        					<li role="presentation"><a href="addNews"><i class="fa fa-plus"></i>Add News</a></li>
        					<li role="presentation"><a href="logout"><i class="fa fa-sign-out m-r-xs"></i>Log out</a></li>
    					</ul>
					</li>
            	</ul> 
            </td>
            <td>
            	<div style="margin-left: 60px; font-size: 20px;">
            		<a href="#"><i class="fa fa-facebook"></i></a>
            	</div>
            </td>
            <td>
            	<div style="margin-left: 30px; font-size: 20px;">
            		<a href="#"><i class="fa fa-twitter"></i></a>
            	</div>
            </td>
            <td>
            	<div style="margin-left: 30px; font-size: 20px;">
            		<a href="#"><i class="fa fa-rss"></i></a>
            	</div>
            </td>
		</tr>
	</table>
</div>

<%
    }
%>