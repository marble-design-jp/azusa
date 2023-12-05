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
    <xsl:when test="$appendSort = concat($field, '_down')"><xsl:text> ▼</xsl:text></xsl:when>
    <xsl:when test="$appendSort = concat($field, '_up')"><xsl:text> ▲</xsl:text></xsl:when>
  </xsl:choose>
</xsl:template>

<!-- 表示件数の切り替え -->
<xsl:template name="limiter">
  <xsl:param name="limit" />
    <select name="_limit_{/table/@tableId}">
      <option value="10"><xsl:if test="$limit = '10'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>10件</option>
      <option value="50"><xsl:if test="$limit = '50'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>50件</option>
      <option value="100"><xsl:if test="$limit = '100'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>100件</option>
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
              <a href="{@url}"><xsl:value-of select="." /></a>
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
	  <div class="smp-table zenkaitou">
          <xsl:apply-templates select="pager" />
			</div>
	  <div class="zenkaitou_area">
    <table id="smp-table-{@tableId}" class="smp-table" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
      <col class="smp-col-1" width="50" />
      <col class="smp-col-2" width="100" />
      <col class="smp-col-3" width="100" />
      <col class="smp-col-4" width="100" />
      <col class="smp-col-5" width="100" />
      <col class="smp-col-6" width="100" />
      <col class="smp-col-7" width="100" />
      <col class="smp-col-8" width="100" />
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

      <tr class="smp-row-3 smp-row-sort" style="height:20;">
        <th class="smp-cell-sort smp-cell-3-1 smp-cell smp-cell-row-3 smp-cell-col-1" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='answer_ID']/@sort}">
            <xsl:text>回答ID</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421630'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-2 smp-cell smp-cell-row-3 smp-cell-col-2" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='oldstatus']/@sort}">
            <xsl:text>ステータス</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421631'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-3 smp-cell smp-cell-row-3 smp-cell-col-3" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='answer_link']/@sort}">
            <xsl:text>回答リンク</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421632'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-4 smp-cell smp-cell-row-3 smp-cell-col-4" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='loginmail_date']/@sort}">
            <xsl:text>ログイン確認依頼メール配信日</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421633'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-5 smp-cell smp-cell-row-3 smp-cell-col-5" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='reply_deadline']/@sort}">
            <xsl:text>回答期限</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421634'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-6 smp-cell smp-cell-row-3 smp-cell-col-6" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='answerup_date']/@sort}">
            <xsl:text>回答更新日</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421635'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-7 smp-cell smp-cell-row-3 smp-cell-col-7" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='base_name']/@sort}">
            <xsl:text>海外拠点名（英・中）</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421636'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-8 smp-cell smp-cell-row-3 smp-cell-col-8" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='oldcountry']/@sort}">
            <xsl:text>Country</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421637'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-9 smp-cell smp-cell-row-3 smp-cell-col-9" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='survey_period']/@sort}">
            <xsl:text>調査対象期</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421638'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-10 smp-cell smp-cell-row-3 smp-cell-col-10" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='oldsurvey_type']/@sort}">
            <xsl:text>調査種別</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421639'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-11 smp-cell smp-cell-row-3 smp-cell-col-11" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='division']/@sort}">
            <xsl:text>事業部</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421640'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-12 smp-cell smp-cell-row-3 smp-cell-col-12" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='res_name']/@sort}">
            <xsl:text>回答者氏名</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421641'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-13 smp-cell smp-cell-row-3 smp-cell-col-13" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='res_department']/@sort}">
            <xsl:text>回答者部署</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421642'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-14 smp-cell smp-cell-row-3 smp-cell-col-14" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='res_post']/@sort}">
            <xsl:text>回答者役職</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421643'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-15 smp-cell smp-cell-row-3 smp-cell-col-15" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='mail']/@sort}">
            <xsl:text>連絡先メールアドレス</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421644'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-16 smp-cell smp-cell-row-3 smp-cell-col-16" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='pass_date']/@sort}">
            <xsl:text>最終ログイン日時</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421645'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-17 smp-cell smp-cell-row-3 smp-cell-col-17" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='res_lastupdate']/@sort}">
            <xsl:text>回答者更新日時</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421646'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-18 smp-cell smp-cell-row-3 smp-cell-col-18" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='oldans_remin']/@sort}">
            <xsl:text>回答リマインド</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421647'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-19 smp-cell smp-cell-row-3 smp-cell-col-19" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='rating']/@sort}">
            <xsl:text>評点</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421648'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-20 smp-cell smp-cell-row-3 smp-cell-col-20" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='rr_stage']/@sort}">
            <xsl:text>RRステージ</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421649'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-21 smp-cell smp-cell-row-3 smp-cell-col-21" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='a_deadline']/@sort}">
            <xsl:text>Aプランシート提出期限</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421650'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-22 smp-cell smp-cell-row-3 smp-cell-col-22" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='a_filingdate']/@sort}">
            <xsl:text>Aプランシート提出日</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421651'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-23 smp-cell smp-cell-row-3 smp-cell-col-23" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='rr_filingdate']/@sort}">
            <xsl:text>RR評価シート提出日</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421652'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-24 smp-cell smp-cell-row-3 smp-cell-col-24" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='laep_ep']/@sort}">
            <xsl:text>LAEP/EP</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421653'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-25 smp-cell smp-cell-row-3 smp-cell-col-25" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='aep_rec']/@sort}">
            <xsl:text>AEP</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421654'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-26 smp-cell smp-cell-row-3 smp-cell-col-26" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='op_rec']/@sort}">
            <xsl:text>OP</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421655'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-27 smp-cell smp-cell-row-3 smp-cell-col-27" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='okap_rec']/@sort}">
            <xsl:text>OKAP</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421656'" />
            </xsl:call-template>
          </a>
        </th>
        <th class="smp-cell-sort smp-cell-3-28 smp-cell smp-cell-row-3 smp-cell-col-28" style="border:1px solid #999999;padding:5px;font-size:10pt;font-weight:bold;color:#444444;background-color:#DCDCDE;" align="center">
          <a href="{/table/fieldList/field[@title='em_rec']/@sort}">
            <xsl:text>EM</xsl:text>
            <xsl:call-template name="sortText">
              <xsl:with-param name="field" select="'f004421657'" />
            </xsl:call-template>
          </a>
        </th>
      </tr>
      <xsl:for-each select="data/record">
        <xsl:variable name="row" select="position() + 3" />
        <xsl:variable name="recordPosition" select="position() + number(/table/pager/@offset_start) - 1" />
        <xsl:variable name="id" select="@id" />
        <xsl:variable name="usr_answer_ID" select="usr_answer_ID" />
        <tr style="height:20;">
          <xsl:attribute name="class">
            <xsl:text>smp-row-</xsl:text><xsl:value-of select="$row" />
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
            <a href="{/table/cardList/card[@title='page_216582'][@recordId=$id]}&amp;answerId={$usr_answer_ID}" target="_self">
              <xsl:value-of select="usr_answer_ID" />
            </a>
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
            <xsl:value-of select="usr_oldstatus" />
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
            <xsl:value-of select="usr_answer_link" />
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
            <xsl:value-of select="usr_answerup_date/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-7 smp-cell smp-cell-row-{$row} smp-cell-col-7" align="left">
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
            <xsl:value-of select="usr_base_name" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-8 smp-cell smp-cell-row-{$row} smp-cell-col-8" align="left">
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
            <xsl:value-of select="usr_oldcountry" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-9 smp-cell smp-cell-row-{$row} smp-cell-col-9" align="left">
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
            <xsl:value-of select="usr_survey_period/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-10 smp-cell smp-cell-row-{$row} smp-cell-col-10" align="left">
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
            <xsl:value-of select="usr_oldsurvey_type" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-11 smp-cell smp-cell-row-{$row} smp-cell-col-11" align="left">
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
            <xsl:value-of select="usr_division" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-12 smp-cell smp-cell-row-{$row} smp-cell-col-12" align="left">
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
            <xsl:value-of select="usr_res_name" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-13 smp-cell smp-cell-row-{$row} smp-cell-col-13" align="left">
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
            <xsl:value-of select="usr_res_department" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-14 smp-cell smp-cell-row-{$row} smp-cell-col-14" align="left">
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
            <xsl:value-of select="usr_res_post" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-15 smp-cell smp-cell-row-{$row} smp-cell-col-15" align="left">
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
            <xsl:value-of select="usr_mail" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-16 smp-cell smp-cell-row-{$row} smp-cell-col-16" align="left">
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
            <xsl:value-of select="usr_pass_date/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-17 smp-cell smp-cell-row-{$row} smp-cell-col-17" align="left">
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
            <xsl:value-of select="usr_res_lastupdate/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-18 smp-cell smp-cell-row-{$row} smp-cell-col-18" align="left">
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
            <xsl:value-of select="usr_oldans_remin" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-19 smp-cell smp-cell-row-{$row} smp-cell-col-19" align="left">
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
            <xsl:value-of select="usr_rating" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-20 smp-cell smp-cell-row-{$row} smp-cell-col-20" align="left">
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
            <xsl:value-of select="usr_rr_stage" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-21 smp-cell smp-cell-row-{$row} smp-cell-col-21" align="left">
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
            <xsl:value-of select="usr_a_deadline/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-22 smp-cell smp-cell-row-{$row} smp-cell-col-22" align="left">
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
            <xsl:value-of select="usr_a_filingdate/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-23 smp-cell smp-cell-row-{$row} smp-cell-col-23" align="left">
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
            <xsl:value-of select="usr_rr_filingdate/full_text" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-24 smp-cell smp-cell-row-{$row} smp-cell-col-24" align="left">
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
            <xsl:value-of select="usr_laep_ep" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-25 smp-cell smp-cell-row-{$row} smp-cell-col-25" align="left">
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
            <xsl:value-of select="usr_aep_rec" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-26 smp-cell smp-cell-row-{$row} smp-cell-col-26" align="left">
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
            <xsl:value-of select="usr_op_rec" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-27 smp-cell smp-cell-row-{$row} smp-cell-col-27" align="left">
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
            <xsl:value-of select="usr_okap_rec" />
          </td>
          <td class="smp-cell-data smp-cell-{$row}-28 smp-cell smp-cell-row-{$row} smp-cell-col-28" align="left">
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
            <xsl:value-of select="usr_em_rec" />
          </td>
        </tr>
      </xsl:for-each>
      <tr class="smp-row-14 smp-row-normal" style="height:20;">
        <td class="smp-cell-14-1 smp-cell smp-cell-row-14 smp-cell-col-1" style="font-size:10pt;" align="right" colspan="6">
          
        </td>
        <td class="smp-cell-14-7 smp-cell smp-cell-row-14 smp-cell-col-7"></td>
        <td class="smp-cell-14-8 smp-cell smp-cell-row-14 smp-cell-col-8"></td>
        <td class="smp-cell-14-9 smp-cell smp-cell-row-14 smp-cell-col-9"></td>
        <td class="smp-cell-14-10 smp-cell smp-cell-row-14 smp-cell-col-10"></td>
        <td class="smp-cell-14-11 smp-cell smp-cell-row-14 smp-cell-col-11"></td>
        <td class="smp-cell-14-12 smp-cell smp-cell-row-14 smp-cell-col-12"></td>
        <td class="smp-cell-14-13 smp-cell smp-cell-row-14 smp-cell-col-13"></td>
        <td class="smp-cell-14-14 smp-cell smp-cell-row-14 smp-cell-col-14"></td>
        <td class="smp-cell-14-15 smp-cell smp-cell-row-14 smp-cell-col-15"></td>
        <td class="smp-cell-14-16 smp-cell smp-cell-row-14 smp-cell-col-16"></td>
        <td class="smp-cell-14-17 smp-cell smp-cell-row-14 smp-cell-col-17"></td>
        <td class="smp-cell-14-18 smp-cell smp-cell-row-14 smp-cell-col-18"></td>
        <td class="smp-cell-14-19 smp-cell smp-cell-row-14 smp-cell-col-19"></td>
        <td class="smp-cell-14-20 smp-cell smp-cell-row-14 smp-cell-col-20"></td>
        <td class="smp-cell-14-21 smp-cell smp-cell-row-14 smp-cell-col-21"></td>
        <td class="smp-cell-14-22 smp-cell smp-cell-row-14 smp-cell-col-22"></td>
        <td class="smp-cell-14-23 smp-cell smp-cell-row-14 smp-cell-col-23"></td>
        <td class="smp-cell-14-24 smp-cell smp-cell-row-14 smp-cell-col-24"></td>
        <td class="smp-cell-14-25 smp-cell smp-cell-row-14 smp-cell-col-25"></td>
        <td class="smp-cell-14-26 smp-cell smp-cell-row-14 smp-cell-col-26"></td>
        <td class="smp-cell-14-27 smp-cell smp-cell-row-14 smp-cell-col-27"></td>
        <td class="smp-cell-14-28 smp-cell smp-cell-row-14 smp-cell-col-28"></td>
      </tr>
    </table>
		  </div>
  </form>
</xsl:template>

</xsl:stylesheet>
