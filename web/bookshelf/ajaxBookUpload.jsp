<div class="input-box book-upload-box">
    <div class="box-title">
            <h2>Book Upload</h2>
    </div>
    <div class="input-form">    
        <div class="input-field">                        
            <input class="input" type="text" name="fname" placeholder="ISBN 13" required="" maxlength="100">
        </div>					                   
        <input id="fetch_book" class="input-submit" type="submit" name="register" value="Fetch">							
    </div>
    <div class="input-suggestion">	            	
            <div class="content">
            <form action="../UploadBook" method="GET">
                    <input class="input" type="hidden" name="isbn" >
                    <div class="input-field">                       
                        <input class="input" type="text" name="bookid" placeholder="Book Id" required="" maxlength="100">
                    </div>
                    <div class="input-field">                       
                        <input class="input" type="text" name="title" placeholder="Title" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="text" name="author" placeholder="Author" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="text" name="publisher" placeholder="Publisher" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <textarea class="input" type="text" name="desc" placeholder="description" required=""  maxlength="500"></textarea>
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="text" name="date" placeholder="date" required="" maxlength="20">
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="number" name="page" placeholder="page count" required="" maxlength="5">
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="text" name="thumbnail" placeholder="thumbnail url" required="" maxlength="150">
                    </div>
                    
                    <input class="input-submit" type="submit" name="register" value="Upload">							
            </form>					
            </div>		
    </div>
</div>