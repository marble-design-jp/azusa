<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template match="/">
        <xsl:apply-templates select="table" />
    </xsl:template>

    <!-- ソート状態のテキスト -->
    <xsl:template name="sortText">
        <xsl:param name="field" />
        <xsl:variable name="appendSort" select="/table/data/@sort" />
        <xsl:choose>
            <xsl:when test="$appendSort = concat($field, '_down')">
                <xsl:text> ▼</xsl:text>
            </xsl:when>
            <xsl:when test="$appendSort = concat($field, '_up')">
                <xsl:text> ▲</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- 表示件数の切り替え -->
    <xsl:template name="limiter">
        <xsl:param name="limit" />
        <select name="_limit_{/table/@tableId}">
            <option value="10">
                <xsl:if test="$limit = '10'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>10件
            </option>
            <option value="50">
                <xsl:if test="$limit = '50'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>50件
            </option>
            <option value="100">
                <xsl:if test="$limit = '100'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>100件
            </option>
        </select>
        <input type="submit" name="smp-table-submit-button" value="表示" />
    </xsl:template>

    <!-- ページャー -->
    <xsl:template match="pager">
        <table class="smp-pager">
            <tr>
                <xsl:for-each select="page">
                    <td>
                        <xsl:choose>
                            <xsl:when test="@current = 'true'">
                                <xsl:attribute name="class">smp-page smp-current-page</xsl:attribute>
                                <xsl:value-of select="." />
                            </xsl:when>
                            <xsl:when test="@omit = 'true'">
                                <xsl:attribute name="class">smp-page smp-page-space</xsl:attribute>
                                <xsl:value-of select="." />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="class">smp-page</xsl:attribute>
                                <a href="{@url}">
                                    <xsl:value-of select="." /></a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </xsl:for-each>
            </tr>
        </table>
    </xsl:template>

    <!-- データ部分 -->
    <xsl:template match="/table">
        <script type="text/javascript" src="{@jsPath}" charset="{@jsEncode}"></script>
        <form method="post" action="{@action}">
            $hidden:table:extension$
            <table id="smp-table-{@tableId}" class="smp-table" cellspacing="0" cellpadding="0"
                style="border-collapse:collapse;">
                <col class="smp-col-1" width="50" />
                <col class="smp-col-2" width="100" />
                <col class="smp-col-3" width="100" />
                <col class="smp-col-4" width="100" />
                <col class="smp-col-5" width="100" />
                <col class="smp-col-6" width="100" />
                <col class="smp-col-7" width="100" />
                <col class="smp-col-8" width="10" />
                <tr class="smp-row-1 smp-row-normal" style="height:20;">
                    <td class="smp-cell-1-1 smp-cell smp-cell-row-1 smp-cell-col-1"></td>
                    <td class="smp-cell-1-2 smp-cell smp-cell-row-1 smp-cell-col-2"></td>
                    <td class="smp-cell-1-3 smp-cell smp-cell-row-1 smp-cell-col-3"></td>
                    <td class="smp-cell-1-4 smp-cell smp-cell-row-1 smp-cell-col-4"></td>
                    <td class="smp-cell-1-5 smp-cell smp-cell-row-1 smp-cell-col-5"></td>
                    <td class="smp-cell-1-7 smp-cell smp-cell-row-1 smp-cell-col-6"
                        style="font-size:10pt;color:#444444;" align="right" colspan="2">
                        <font class="smp-offset-start">
                            <xsl:value-of select="pager/@offset_start" />
                        </font> - <font class="smp-offset-end">
                            <xsl:value-of select="pager/@offset_end" />
                        </font>件 / <font class="smp-count">
                            <xsl:value-of select="data/@total" />
                        </font>件<br />
                        <xsl:call-template name="limiter">
                            <xsl:with-param name="limit" select="data/@limit" />
                        </xsl:call-template>
                    </td>
                </tr>
                <tr class="smp-row-2 smp-row-normal" style="height:20;">
                    <td class="smp-cell-2-1 smp-cell smp-cell-row-2 smp-cell-col-1"
                        style="padding:0px;font-size:10pt;font-weight:bold;" align="left" colspan="2">
                        <font class="smp-title">回答一覧</font>
                    </td>
                    <td class="smp-cell-2-3 smp-cell smp-cell-row-2 smp-cell-col-3"></td>
                    <td class="smp-cell-2-4 smp-cell smp-cell-row-2 smp-cell-col-4"></td>
                    <td class="smp-cell-2-5 smp-cell smp-cell-row-2 smp-cell-col-5"></td>
                    <td class="smp-cell-2-6 smp-cell smp-cell-row-2 smp-cell-col-6" style="font-size:10pt;"
                        align="right" colspan="2">
                        <xsl:apply-templates select="pager" />
                    </td>
                </tr>
                <tr class="smp-row-3 smp-row-sort" style="height:20;">
                    <td class="smp-cell-sort smp-cell-3-1 smp-cell smp-cell-row-3 smp-cell-col-1"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/@idSort}">
                            <xsl:text>id</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'id'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-2 smp-cell smp-cell-row-3 smp-cell-col-2"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='azusa_kind']/@sort}">
                            <xsl:text>種別</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379882'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-3 smp-cell smp-cell-row-3 smp-cell-col-3"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='answerID']/@sort}">
                            <xsl:text>回答ID</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379886'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-4 smp-cell smp-cell-row-3 smp-cell-col-4"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='azusa_status']/@sort}">
                            <xsl:text>ステータス</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379892'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-5 smp-cell smp-cell-row-3 smp-cell-col-5"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='companyID']/@sort}">
                            <xsl:text>企業ID</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379887'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-6 smp-cell smp-cell-row-3 smp-cell-col-6"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='companyName']/@sort}">
                            <xsl:text>企業名</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379888'" />
                            </xsl:call-template>
                        </a>
                    </td>
                    <td class="smp-cell-sort smp-cell-3-7 smp-cell smp-cell-row-3 smp-cell-col-7"
                        style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;"
                        align="center">
                        <a href="{/table/fieldList/field[@title='registDate']/@sort}">
                            <xsl:text>登録日時</xsl:text>
                            <xsl:call-template name="sortText">
                                <xsl:with-param name="field" select="'f004379884'" />
                            </xsl:call-template>
                        </a>
                    </td>
                </tr>
                <xsl:for-each select="data/record">
                    <xsl:variable name="row" select="position() + 3" />
                    <xsl:variable name="recordPosition" select="position() + number(/table/pager/@offset_start) - 1" />
                    <xsl:variable name="id" select="@id" />
                    <xsl:variable name="usr_companyID" select="usr_companyID" />
                    <xsl:variable name="usr_answerID" select="usr_answerID" />
                    <xsl:variable name="usr_department_id" select="usr_department_id" />
                    <tr style="height:20;">
                        <xsl:attribute name="class">
                            <xsl:text>smp-row-</xsl:text>
                            <xsl:value-of select="$row" />
                            <xsl:text> smp-row-data</xsl:text>
                            <xsl:if test="string(./*/@hasError) = 'true'">
                                <xsl:text> smp-valid-err-row</xsl:text>
                            </xsl:if>
                        </xsl:attribute>
                        <td class="smp-cell-data smp-cell-{$row}-1 smp-cell smp-cell-row-{$row} smp-cell-col-1"
                            align="center">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="@id" />
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-2 smp-cell smp-cell-row-{$row} smp-cell-col-2"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="usr_azusa_kind" />
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-3 smp-cell smp-cell-row-{$row} smp-cell-col-3"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <a href="{/table/cardList/card[@title='page_216480'][@recordId=$id]}" target="_self">
                                <xsl:value-of select="usr_answerID" />
                            </a>
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-4 smp-cell smp-cell-row-{$row} smp-cell-col-4"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="usr_azusa_status" />
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-5 smp-cell smp-cell-row-{$row} smp-cell-col-5"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <a href="{/table/cardList/card[@title='page_216480'][@recordId=$id]}"
                                onclick="updateUrlCompany(event)" data-company="{$usr_companyID}" data-department="{$usr_department_id}"  data-member="{@id}" target="_self">
                                <xsl:value-of select="usr_companyID" />
                            </a>
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-6 smp-cell smp-cell-row-{$row} smp-cell-col-6"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="usr_companyName" />
                        </td>
                        <td class="smp-cell-data smp-cell-{$row}-7 smp-cell smp-cell-row-{$row} smp-cell-col-7"
                            align="left">
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                    </xsl:when>
                                    <xsl:otherwise>
                                        border-width:0px
                                        1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="usr_registDate/full_text" />
                        </td>
                    </tr>
                </xsl:for-each>
                <tr class="smp-row-14 smp-row-normal" style="height:10;">
                    <td class="smp-cell-14-1 smp-cell smp-cell-row-14 smp-cell-col-1"
                        style="font-size:10pt;border:1px solid #999999;background-color:#DCDCDE;" align="left"
                        colspan="7">

                    </td>
                    <td class="smp-cell-14-9 smp-cell smp-cell-row-14 smp-cell-col-9"></td>
                </tr>
                <tr class="smp-row-15 smp-row-normal" style="height:20;">
                    <td class="smp-cell-15-1 smp-cell smp-cell-row-15 smp-cell-col-1" style="font-size:10pt;"
                        align="right" colspan="7">
                        <xsl:apply-templates select="pager" />
                    </td>
                    <td class="smp-cell-15-9 smp-cell smp-cell-row-15 smp-cell-col-9"></td>
                </tr>
            </table>
        </form>
        <script>
            function updateUrlCompany(event) {
                var companyId = event.target.dataset.company ?? event.target.innerText;
                var departmentId = event.target.dataset.department ?? '';
                var memberId = event.target.dataset.member;

                var currentUrl = event.target.href;

                var urlSearchParams = new URLSearchParams(window.location.search);

                urlSearchParams.set('_card_page_id', '213179');

                urlSearchParams.set('45652_4379887_1', companyId);
                urlSearchParams.set('46095_4414157_1', companyId);
                urlSearchParams.set('company_id', companyId);
                urlSearchParams.set('member_id', memberId);
                urlSearchParams.set('46095_4414161_1', departmentId);

                var newUrl = currentUrl.split('?')[0] + '?' + urlSearchParams.toString();

                event.target.href = newUrl;
            }
        </script>
    </xsl:template>

</xsl:stylesheet>