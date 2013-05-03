<hr/>
<div>
    <%/* Success Notification */
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Account Restore Successfully',
                pnotify_animation: {effect_in: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 0;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 1;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0)
                                callback();
                        }, 20);
                    }, effect_out: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 1;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 0;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                                cur_opacity_scale = 1 - cur_opacity_scale;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0) {
                                pnotify.hide();
                                callback();
                            }
                        }, 20);
                    }}
            });
        });
    </script>

    <%} else if (status == 3) {%>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Account Deleted Successfully',
                pnotify_animation: {effect_in: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 0;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 1;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0)
                                callback();
                        }, 20);
                    }, effect_out: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 1;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 0;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                                cur_opacity_scale = 1 - cur_opacity_scale;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0) {
                                pnotify.hide();
                                callback();
                            }
                        }, 20);
                    }}
            });
        });
    </script>
    <%}
        }%>
</div>
<form method="post" name="formID" action="Trash.htm">
    <input name="menu" value="Trash" type="hidden"/>
    <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-table-1">View All Account</span>
        </div>
        <div class="mws-panel-body">
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th ><a onclick="check_all_in_document()"><input type="checkbox" id="chked" name="chked"  /></a></th>  
                        <th>Account Name</th>
                        <th>Address</th>
                        <th>Phone NO</th>
                        <th>Office NO</th>
                        <th>E-Mail</th>
                        <th>Limits</th>
                    </tr>
                </thead>
                <tbody>
                    <% List ltTrash = (List) request.getAttribute("dataTrash");
                        HashMap hmTrash = null;
                        if (ltTrash != null) {
                            for (int i = 0; i < ltTrash.size(); i++) {
                                hmTrash = (HashMap) ltTrash.get(i);
                    %>
                    <tr class="gradeX">
                        <td><input type="checkbox" id="Trash" name="Trash" class="validate[minCheckbox[1]]" value="<%out.print(hmTrash.get("Ac_id"));%>" ></td>
                        <td><%  out.print(hmTrash.get("Ac_Name"));%></td>
                        <td><%  out.print(hmTrash.get("C_Address") + "," + hmTrash.get("S_name") + "," + hmTrash.get("C_name"));%></td>
                        <td><%  out.print(hmTrash.get("Contact_No"));%></td>
                        <td><%  out.print(hmTrash.get("Phone_No"));%></td>
                        <td><%  out.print(hmTrash.get("Email_id"));%></td>
                        <td><% if (hmTrash.get("Bal_Type").equals("Dr") == true) {
                                out.print(hmTrash.get("Dr_Limit") + " Dr");
                            } else {
                                out.print(hmTrash.get("Cr_Limit") + " Cr");
                            }
                            %></td>
                    </tr>
                    <%}
                        }%>
                </tbody>
                <div align="center" class="mws-button-row">
                    <%
                        if (lper != null) {
                            hper = (HashMap) lper.get(7);
                        }
                        UST = session.getAttribute("User_Type");
                        if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Add").toString().equals("1")))) {
                    %>
                    <input type="submit" class="mws-button save green" name="action" value="Restore" />
                    <%}%>
                    <% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {%>
                    <input type="submit" class="mws-button save green" name="action" value="Delete" />
                    <%}%>
                    <!--input type="reset" value="Reset" class="mws-button green" /-->
                </div>
            </table>
        </div>
    </div>
</form>

<script type="text/javascript">
    function check_all_in_document()
    {

        document.formID.chked.checked=false;
        var c = new Array();
        c = document.getElementsByTagName('input');
        for (var i = 0; i < c.length; i++)
        {
            if (c[i].type == 'checkbox')
            {
		
                if(c[i].checked == true)
                {
                    document.formID.chked.checked=false;
                    c[i].checked = false;
                }
                else
                {
                    c[i].checked = true;
                }
            }

        }
    }
</script>