
    <div class="list header-list">
        <script type="text/javascript">

            function _role_filter(v, delimit) {
                var results = "";
                for (i in v) {
                    role = v[i];

                    results += role + delimit;
                }

                return results;
            }

            function _role_filter_br(v) { return _role_filter(v, "<br/>"); }
            function _role_filter_sp(v) { return _role_filter(v, " "); }
        </script>
        <div id="grid-controls">
            <form>
              <div id="filter" class="grid_filter" name="release_filter">

                <label for="release">Release:</label>
                <select name="release">
                    % for (i, rel) in enumerate(release_table):
                      % if i == 0:
                        <option selected="selected" value="${rel['value']}">${rel['label']}</option>
                      % else:
                        <option value="${rel['value']}">${rel['label']}</option>
                      % endif
                    % endfor
                </select>
              </div>
            </form>
        </div>
        <table id="${id}">
            <thead>
              <th>Name</th>
              <th>Roles</th>
            </thead>
            <tbody class="rowtemplate">
                    <tr>
                        <td>
                            <span class="@{roles:filter(_role_filter_sp)}">
                                <a href="/people/?username=@{name}" moksha_url="dynamic">@{name}</a>
                            </span>
                        </td>
                        <td>
                            @{roles:filter(_role_filter_br)}
                        </td>
                    </tr>
                </tbody>
        </table>
        <div id="grid-controls" if="total_rows == 0">
            <div class="message template" id="info_display" >
                No @{filters:index("type")} found for the @{filters:index("package")} package
            </div>
        </div>
        <div id="grid-controls" if="total_rows != 0">
            <div class="message template" id="info_display" >
                @{total_rows} @{filters:index("type")} found for the @{filters:index("package")} package
            </div>
        </div>
    </div>