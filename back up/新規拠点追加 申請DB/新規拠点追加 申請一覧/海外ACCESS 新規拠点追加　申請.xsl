<?xml version="1.0" encoding="EUC-JP" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/searchForm">
        <div class="search_form">
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
                        <xsl:apply-templates select="fieldList/usr_new_basestatus" />
                        <xsl:apply-templates select="fieldList/sys_multiSearch" />
                        <tr class="smp-sf-row">
                            <td colspan="2" align="center">
                                <div class="serch_btn">
                                    <input style="margin:5px;" type="submit" name="smp_sf_button_46309" value="検索" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </xsl:template>

    <!-- ステータス -->
    <xsl:template match="usr_new_basestatus">
        <tr class="smp-sf-row">
            <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px">
      ステータス
            </td>
            <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px">
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

    <!-- キーワード -->
    <xsl:template match="sys_multiSearch">
        <tr class="smp-sf-row">
            <td class="smp-sf-head" style="border:1px solid #999999; padding:5px; font-size:9pt; color:#202020; font-weight:bold; background-color:#DEDEDE; width:150px">
      キーワード
            </td>
            <td class="smp-sf-body" style="border:1px solid #999999; padding:5px; background-color:#FFFFFF; font-size:9pt; width:300px">
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
