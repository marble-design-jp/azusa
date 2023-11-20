<?xml version="1.0" encoding="EUC-JP" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/searchForm">
  <div class="smp-search-form">
    <form method="get">
      <xsl:if test="/searchForm/@action">
        <xsl:attribute name="action">
          <xsl:value-of select="/searchForm/@action" />
        </xsl:attribute>
      </xsl:if>
      <!-- hidden -->
      $hidden:sf:extension$
      <table class="smp-search-form-table" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
        <xsl:apply-templates select="fieldList/usr_registDate" />
        <xsl:apply-templates select="fieldList/usr_lastupDate" />
        <xsl:apply-templates select="fieldList/usr_answerID" />
        <xsl:apply-templates select="fieldList/usr_azusa_status" />
        <xsl:apply-templates select="fieldList/usr_companyID" />
        <xsl:apply-templates select="fieldList/usr_department_id" />
        <tr class="smp-sf-row">
          <td colspan="2" align="center">
            <input style="margin:5px;" type="submit" name="smp_sf_button_45652" value="検索" />
          </td>
        </tr>
      </table>
    </form>
  </div>
</xsl:template>

<!-- 登録日時 -->
<xsl:template match="usr_registDate">
  <tr class="smp-sf-row">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px;">
      登録日時
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td>
            <div>
              <input type="text" name="{main/value1/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main/value1" />
                  </xsl:attribute>
                </xsl:if>
              </input>
                から
              <input type="text" name="{main/value2/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main/value2" />
                  </xsl:attribute>
                </xsl:if>
              </input>
                まで
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

<!-- 更新日時 -->
<xsl:template match="usr_lastupDate">
  <tr class="smp-sf-row">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px;">
      更新日時
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td>
            <div>
              <input type="text" name="{main/value1/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main/value1" />
                  </xsl:attribute>
                </xsl:if>
              </input>
                から
              <input type="text" name="{main/value2/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main/value2" />
                  </xsl:attribute>
                </xsl:if>
              </input>
                まで
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

<!-- 回答ID -->
<xsl:template match="usr_answerID">
  <tr class="smp-sf-row">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px;">
      回答ID
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td style="display:none;">
            <input type="hidden" name="{option/exType/@name}" value="16" />
          </td>
        </tr>
        <tr>
          <td>
            <div>
              <input type="text" style="width:100%;" name="{main/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main" />
                  </xsl:attribute>
                </xsl:if>
              </input>
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

<!-- ステータス -->
<xsl:template match="usr_azusa_status">
  <tr class="smp-sf-row">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px;">
      ステータス
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td>
            <div>
              <xsl:for-each select="main/select">
                <div>
                  <xsl:if test="not(@newLine = 't')">
                    <xsl:attribute name="style">float:left;</xsl:attribute>
                  </xsl:if>
                  <label>
                    <span>
                      <input type="checkbox" name="{../@name}" value="{@value}">
                        <xsl:if test="@selected = 't'">
                          <xsl:attribute name="checked">t</xsl:attribute>
                        </xsl:if>
                      </input>
                      <xsl:value-of select="." />
                    </span>
                  </label>
                </div>
              </xsl:for-each>
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

<!-- 企業ID -->
<xsl:template match="usr_companyID">
  <tr class="smp-sf-row"  style="display:none;">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px">
      企業ID
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td style="display:none;">
            <input type="hidden" name="{option/exType/@name}" value="16" />
          </td>
        </tr>
        <tr>
          <td>
            <div>
              <input type="text" style="width:100%;" name="{main/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main" />
                  </xsl:attribute>
                </xsl:if>
              </input>
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

<!-- 部署ID -->
<xsl:template match="usr_department_id">
  <tr class="smp-sf-row"  style="display:none;">
    <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px;">
      部署ID
    </td>
    <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px;">
      <table style="width:100%; font-size:inherit; font-weight:inherit; color:inherit;">
        <tr>
          <td style="display:none;">
            <input type="hidden" name="{option/exType/@name}" value="16" />
          </td>
        </tr>
        <tr>
          <td>
            <div>
              <input type="text" style="width:100%;" name="{main/@name}">
                <xsl:if test=".">
                  <xsl:attribute name="value">
                    <xsl:value-of select="main" />
                  </xsl:attribute>
                </xsl:if>
              </input>
            </div>
          </td>
          <td style="display:none;">
            <input type="hidden" name="{option/action/@name}" value="0" />
          </td>
        </tr>
      </table>
    <span class="notice" style="font-size:9pt;">
      
    </span>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>