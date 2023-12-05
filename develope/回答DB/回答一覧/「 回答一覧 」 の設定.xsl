<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
                </xsl:if>10件</option>
            <option value="50">
                <xsl:if test="$limit = '50'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>50件</option>
            <option value="100">
                <xsl:if test="$limit = '100'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>100件</option>
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
                                    <xsl:value-of select="." />
                                </a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </xsl:for-each>
            </tr>
        </table>
    </xsl:template>

    <!-- テキストエリア型の改行を反映するためのXSLテンプレート -->
    <xsl:template name="textareaHTML">
        <xsl:param name="content" />
        <!-- 改行を保持させる -->
        <xsl:variable name="match">\n</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($content,$match)">
                <xsl:value-of select="substring-before($content,$match)" />
                <br />
                <!-- 残りを変換 -->
                <xsl:call-template name="textareaHTML">
                    <xsl:with-param name="content" select="substring-after($content,$match)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$content" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="textareaContent">
        <xsl:param name="content" />
        <!-- 改行を保持させる -->
        <xsl:variable name="match">\n</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($content,$match)">
                <xsl:value-of select="substring-before($content,$match)" />
                <!-- 改行を表示 -->
                <xsl:text>
                </xsl:text>
                <xsl:call-template name="textareaContent">
                    <xsl:with-param name="content" select="substring-after($content,$match)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$content" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- データ部分 -->
    <xsl:template match="/table">
        <script type="text/javascript" src="{@jsPath}" charset="{@jsEncode}"></script>
        <form method="post" action="{@action}">
    $hidden:table:extension$
            <div class="smp-table zenkaitou">
                <xsl:apply-templates select="pager" />
            </div>
            <div class="zenkaitou_area">
                <table id="smp-table-{@tableId}" class="smp-table" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                    <col class="smp-col-1" width="113" />
                    <col class="smp-col-2" width="100" />
                    <col class="smp-col-3" width="100" />
                    <col class="smp-col-4" width="100" />
                    <col class="smp-col-5" width="100" />
                    <col class="smp-col-6" width="100" />
                    <col class="smp-col-7" width="108" />
                    <col class="smp-col-8" width="125" />
                    <col class="smp-col-9" width="100" />
                    <col class="smp-col-10" width="100" />
                    <col class="smp-col-11" width="100" />
                    <col class="smp-col-12" width="100" />
                    <col class="smp-col-13" width="100" />
                    <col class="smp-col-14" width="100" />
                    <col class="smp-col-15" width="100" />
                    <col class="smp-col-16" width="100" />
                    <col class="smp-col-17" width="100" />
                    <col class="smp-col-18" width="100" />
                    <col class="smp-col-19" width="100" />
                    <col class="smp-col-20" width="100" />
                    <col class="smp-col-21" width="100" />
                    <col class="smp-col-22" width="100" />
                    <col class="smp-col-23" width="100" />
                    <col class="smp-col-24" width="100" />
                    <col class="smp-col-25" width="100" />
                    <col class="smp-col-26" width="100" />
                    <col class="smp-col-27" width="100" />
                    <col class="smp-col-28" width="100" />
                    <col class="smp-col-29" width="100" />
                    <col class="smp-col-30" width="100" />
                    <tr class="smp-row-1 smp-row-sort" style="height:91;">
                        <th class="smp-cell-sort smp-cell-1-1 smp-cell smp-cell-row-1 smp-cell-col-1" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='enqutete_type']/@sort}">
                                <xsl:text>アンケート種別</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004426211'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-2 smp-cell smp-cell-row-1 smp-cell-col-2" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='answer_ID']/@sort}">
                                <xsl:text>回答ID</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422754'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-3 smp-cell smp-cell-row-1 smp-cell-col-3" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='status']/@sort}">
                                <xsl:text>ステータス</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004426212'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-4 smp-cell smp-cell-row-1 smp-cell-col-4" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='loginmail_date']/@sort}">
                                <xsl:text>アンケート回答メール配信日</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422766'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-5 smp-cell smp-cell-row-1 smp-cell-col-5" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='reply_deadline']/@sort}">
                                <xsl:text>回答期限</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422767'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-6 smp-cell smp-cell-row-1 smp-cell-col-6" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#666666;background-color:#eaecef;" align="center">
                            <a href="{/table/fieldList/field[@title='lastUpdate']/@sort}">
                                <xsl:text>回答更新日</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422748'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-7 smp-cell smp-cell-row-1 smp-cell-col-7" style="border:1px solid #999999;background-color:#eaecef;font-size:10pt;font-weight:bold;color:#666666;" align="center">
                            <a href="{/table/fieldList/field[@title='client_name']/@sort}">
                                <xsl:text>クライアント名</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422769'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-8 smp-cell smp-cell-row-1 smp-cell-col-8" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='client_eng']/@sort}">
                                <xsl:text>クライアント名</xsl:text>
                                <br />
                                <xsl:text>(英語)</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422770'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-9 smp-cell smp-cell-row-1 smp-cell-col-9" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='base_name']/@sort}">
                                <xsl:text>海外拠点名</xsl:text>
                                <br />
                                <xsl:text>(英・中)</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422771'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-10 smp-cell smp-cell-row-1 smp-cell-col-10" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='country']/@sort}">
                                <xsl:text>Country</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422772'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-11 smp-cell smp-cell-row-1 smp-cell-col-11" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='local_code']/@sort}">
                                <xsl:text>Local Entity Code</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422773'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-12 smp-cell smp-cell-row-1 smp-cell-col-12" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='survey_period']/@sort}">
                                <xsl:text>調査対象期</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004426339'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-13 smp-cell smp-cell-row-1 smp-cell-col-13" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='survey_type']/@sort}">
                                <xsl:text>調査種別</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004426213'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-14 smp-cell smp-cell-row-1 smp-cell-col-14" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='bus_apart']/@sort}">
                                <xsl:text>事業部</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422776'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-15 smp-cell smp-cell-row-1 smp-cell-col-15" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='res_name']/@sort}">
                                <xsl:text>回答者氏名</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422777'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-16 smp-cell smp-cell-row-1 smp-cell-col-16" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='res_department']/@sort}">
                                <xsl:text>回答者部署</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422778'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-17 smp-cell smp-cell-row-1 smp-cell-col-17" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='res_post']/@sort}">
                                <xsl:text>回答者役職</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422779'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-18 smp-cell smp-cell-row-1 smp-cell-col-18" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='mail']/@sort}">
                                <xsl:text>連絡先メールアドレス</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422780'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-19 smp-cell smp-cell-row-1 smp-cell-col-19" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='answerup_date']/@sort}">
                                <xsl:text>最終ログイン日時</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422768'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-20 smp-cell smp-cell-row-1 smp-cell-col-20" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='lastUpdate']/@sort}">
                                <xsl:text>回答者更新日時</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422748'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-21 smp-cell smp-cell-row-1 smp-cell-col-21" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='ans_remin']/@sort}">
                                <xsl:text>回答リマインド</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422783'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-22 smp-cell smp-cell-row-1 smp-cell-col-22" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='marks']/@sort}">
                                <xsl:text>評点</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422784'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-23 smp-cell smp-cell-row-1 smp-cell-col-23" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='ac_deadline']/@sort}">
                                <xsl:text>Aプランシート提出期限</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422785'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-24 smp-cell smp-cell-row-1 smp-cell-col-24" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='ac_subm']/@sort}">
                                <xsl:text>Aプランシート提出日</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422786'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-25 smp-cell smp-cell-row-1 smp-cell-col-25" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='rr_subm']/@sort}">
                                <xsl:text>RR評価シート提出日</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422787'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-26 smp-cell smp-cell-row-1 smp-cell-col-26" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='leap_ep']/@sort}">
                                <xsl:text>LAEP/EP</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422788'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-27 smp-cell smp-cell-row-1 smp-cell-col-27" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='aep_rec']/@sort}">
                                <xsl:text>AEP</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422789'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-28 smp-cell smp-cell-row-1 smp-cell-col-28" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='op_rec']/@sort}">
                                <xsl:text>OP</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422790'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-29 smp-cell smp-cell-row-1 smp-cell-col-29" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='okap_rec']/@sort}">
                                <xsl:text>OKAP</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422791'" />
                                </xsl:call-template>
                            </a>
                        </th>
                        <th class="smp-cell-sort smp-cell-1-30 smp-cell smp-cell-row-1 smp-cell-col-30" style="border:1px solid #999999;background-color:#eaecef;color:#666666;font-size:10pt;font-weight:bold;" align="center">
                            <a href="{/table/fieldList/field[@title='em_rec']/@sort}">
                                <xsl:text>EM</xsl:text>
                                <xsl:call-template name="sortText">
                                    <xsl:with-param name="field" select="'f004422792'" />
                                </xsl:call-template>
                            </a>
                        </th>
                    </tr>

                    <xsl:for-each select="data/record">
                        <xsl:variable name="row" select="position() + 1" />
                        <xsl:variable name="recordPosition" select="position() + number(/table/pager/@offset_start) - 1" />
                        <xsl:variable name="id" select="@id" />
                        <xsl:variable name="usr_client_code" select="usr_client_code" />
                        <xsl:variable name="usr_enqutete_type" select="usr_enqutete_type" />
                        <tr style="height:20;">
                            <xsl:attribute name="class">
                                <xsl:text>smp-row-</xsl:text>
                                <xsl:value-of select="$row" />
                                <xsl:text> smp-row-data</xsl:text>
                                <xsl:if test="string(./*/@hasError) = 'true'">
                                    <xsl:text> smp-valid-err-row</xsl:text>
                                </xsl:if>
                            </xsl:attribute>
                            <td class="smp-cell-data smp-cell-{$row}-1 smp-cell smp-cell-row-{$row} smp-cell-col-1" align="center">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="usr_enqutete_type" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-2 smp-cell smp-cell-row-{$row} smp-cell-col-2" align="left">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <a href="{/table/cardList/card[@title='page_216905'][@recordId=$id]}" target="_self" onclick="addClientCodeUrl(event, 1)" data-enqutetetype="{$usr_enqutete_type}">
                                    <xsl:value-of select="usr_answer_ID" />
                                </a>
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-3 smp-cell smp-cell-row-{$row} smp-cell-col-3" align="left">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="usr_status" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-4 smp-cell smp-cell-row-{$row} smp-cell-col-4" align="left">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="usr_loginmail_date/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-5 smp-cell smp-cell-row-{$row} smp-cell-col-5" align="left">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="usr_reply_deadline/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-6 smp-cell smp-cell-row-{$row} smp-cell-col-6" align="left">
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1">
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;
                                        </xsl:when>
                                        <xsl:otherwise>
                  border-width:0px 1px;border-style:solid;border-color:#999999;padding:5px;font-size:10pt;color:#444444;background-color:#F2F5F8;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="usr_lastUpdate/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-7 smp-cell smp-cell-row-{$row} smp-cell-col-7" align="left" style="border-left:1px solid #999999">
                                <a href="{/table/cardList/card[@title='page_216931'][@recordId=$id]}" target="_self" onclick="addClientCodeUrl(event)" data-clientcode="{$usr_client_code}">
                                    <xsl:value-of select="usr_client_name" />
                                </a>
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-8 smp-cell smp-cell-row-{$row} smp-cell-col-8" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_client_eng" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-9 smp-cell smp-cell-row-{$row} smp-cell-col-9" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_base_name" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-10 smp-cell smp-cell-row-{$row} smp-cell-col-10" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_country" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-11 smp-cell smp-cell-row-{$row} smp-cell-col-11" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_local_code" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-12 smp-cell smp-cell-row-{$row} smp-cell-col-12" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_survey_period/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-13 smp-cell smp-cell-row-{$row} smp-cell-col-13" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_survey_type" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-14 smp-cell smp-cell-row-{$row} smp-cell-col-14" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_bus_apart" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-15 smp-cell smp-cell-row-{$row} smp-cell-col-15" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_res_name" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-16 smp-cell smp-cell-row-{$row} smp-cell-col-16" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_res_department" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-17 smp-cell smp-cell-row-{$row} smp-cell-col-17" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_res_post" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-18 smp-cell smp-cell-row-{$row} smp-cell-col-18" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_mail" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-19 smp-cell smp-cell-row-{$row} smp-cell-col-19" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_answerup_date/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-20 smp-cell smp-cell-row-{$row} smp-cell-col-20" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_lastUpdate/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-21 smp-cell smp-cell-row-{$row} smp-cell-col-21" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_ans_remin" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-22 smp-cell smp-cell-row-{$row} smp-cell-col-22" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_marks" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-23 smp-cell smp-cell-row-{$row} smp-cell-col-23" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_ac_deadline/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-24 smp-cell smp-cell-row-{$row} smp-cell-col-24" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_ac_subm/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-25 smp-cell smp-cell-row-{$row} smp-cell-col-25" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_rr_subm/full_text" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-26 smp-cell smp-cell-row-{$row} smp-cell-col-26" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_leap_ep" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-27 smp-cell smp-cell-row-{$row} smp-cell-col-27" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_aep_rec" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-28 smp-cell smp-cell-row-{$row} smp-cell-col-28" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_op_rec" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-29 smp-cell smp-cell-row-{$row} smp-cell-col-29" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_okap_rec" />
                            </td>
                            <td class="smp-cell-data smp-cell-{$row}-30 smp-cell smp-cell-row-{$row} smp-cell-col-30" align="left" style="border-left:1px solid #999999">
                                <xsl:value-of select="usr_em_rec" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
        </form>
        <script>
            function addClientCodeUrl(event, type = '') {
                var clientCode = event.target.dataset.clientcode
                var enquteteType = encodeURIComponent(event.target.dataset.enqutetetype)

                var currentUrl = event.target.href;

                var urlSearchParams = new URLSearchParams(window.location.search);
                var newUrlSearchParams = new URLSearchParams(event.target.href.split('?')[1]);

                if(type == 1){
                    var answerId = encodeURIComponent(event.target.innerText)

                    newUrlSearchParams.set('enquteteType', enquteteType);
                    newUrlSearchParams.set('answerId', answerId);
                } else {
                    newUrlSearchParams.set('46367_4422755_1', clientCode);
                    newUrlSearchParams.set('46368_4422755_1', clientCode);
                    newUrlSearchParams.set('46448_4421659_1', clientCode);
                    newUrlSearchParams.set('46449_4421659_1', clientCode);
                }

                var newUrl = currentUrl.split('?')[0] + '?' + newUrlSearchParams.toString();
                
                event.target.href = newUrl;
            }
        </script>
    </xsl:template>

</xsl:stylesheet>