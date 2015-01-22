<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xdb="http://xmlns.oracle.com/xdb"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:template match="/">
    <html>
      <head />
      <body bgcolor="#003333" text="#FFFFCC" link="#FFCC00" vlink="#66CC99" alink="#669999">
        <FONT FACE="Arial, Helvetica, sans-serif">
          <xsl:for-each select="PurchaseOrder"></xsl:for-each>
          <xsl:for-each select="PurchaseOrder">
            <center>
              <span style="font-family:Arial; font-weight:bold">
                <FONT COLOR="#FF0000">
                  <B>Purchase Order </B>
                </FONT>
              </span>
            </center>
            <br/>
            <center>
              <xsl:for-each select="Reference"> 
                <span style="font-family:Arial; font-weight:bold">
                  <xsl:apply-templates />
                </span> 
              </xsl:for-each>
            </center>
          </xsl:for-each>
          <P>
            <xsl:for-each select="PurchaseOrder">
              <br /> 
            </xsl:for-each>
            <P/>
            <P>
              <xsl:for-each select="PurchaseOrder">
                <br />
              </xsl:for-each>
            </P>
          </P>
          <xsl:for-each select="PurchaseOrder"></xsl:for-each>
          <xsl:for-each select="PurchaseOrder">
            <table border="0" width="100%" BGCOLOR="#000000"> 
              <tbody> 
                <tr> 
                  <td WIDTH="296"> 
                    <P>
                      <B>
                        <FONT SIZE="+1" COLOR="#FF0000" FACE="Arial, Helvetica, sans-serif">Internal
                        </FONT>
                      </B>
                    </P>
                    <table border="0" width="98%" BGCOLOR="#000099"> 
                      <tbody> 
                        <tr> 
                          <td WIDTH="49%">
                            <B>
                              <FONT COLOR="#FFFF00">Actions</FONT>
                            </B>
                          </td>
                          <td WIDTH="51%"> 
                            <xsl:for-each select="Actions"> 
                              <xsl:for-each select="Action"> 
                                <table border="1" WIDTH="143"> 
                                  <xsl:if test="position()=1"> 
                                    <thead> 
                                      <tr> 
                                        <td HEIGHT="21">
                                          <FONT COLOR="#FFFF00">User</FONT>
                                        </td>
                                        <td HEIGHT="21">
                                          <FONT COLOR="#FFFF00">Date</FONT>
                                        </td>
                                      </tr> 
                                    </thead> 
                                  </xsl:if> 
                                  <tbody> 
                                    <tr> 
                                      <td>
                                        <xsl:for-each select="User"> 
                                          <xsl:apply-templates /> 
                                        </xsl:for-each> 
                                      </td>
                                      <td>
                                        <xsl:for-each select="Date"> 
                                          <xsl:apply-templates /> 
                                        </xsl:for-each> 
                                      </td>
                                    </tr> 
                                  </tbody> 
                                </table>
                              </xsl:for-each> 
                            </xsl:for-each> 
                          </td>
                        </tr> 
                        <tr> 
                          <td WIDTH="49%">
                            <B>
                              <FONT COLOR="#FFFF00">Requestor</FONT>
                            </B>
                          </td>
                          <td WIDTH="51%"> 
                            <xsl:for-each select="Requestor"> 
                              <xsl:apply-templates /> 
                            </xsl:for-each> 
                          </td>
                        </tr> 
                        <tr> 
                          <td WIDTH="49%">
                            <B>
                              <FONT COLOR="#FFFF00">User</FONT>
                            </B>
                          </td>
                          <td WIDTH="51%"> 
                            <xsl:for-each select="User"> 
                              <xsl:apply-templates /> 
                            </xsl:for-each> 
                          </td>
                        </tr> 
                        <tr> 
                          <td WIDTH="49%">
                            <B>
                              <FONT COLOR="#FFFF00">Cost Center</FONT>
                            </B>
                          </td>
                          <td WIDTH="51%"> 
                            <xsl:for-each select="CostCenter"> 
                              <xsl:apply-templates /> 
                            </xsl:for-each>
                          </td>
                        </tr> 
                      </tbody> 
                    </table>
                  </td>
                  <td width="93" /> 
                  <td valign="top" WIDTH="340">
                    <B>
                      <FONT COLOR="#FF0000"> 
                        <FONT SIZE="+1">Ship To</FONT>
                      </FONT>
                    </B>
                    <xsl:for-each select="ShippingInstructions">
                      <xsl:if test="position()=1"></xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="ShippingInstructions">
                      <xsl:if test="position()=1">
                        <table border="0" BGCOLOR="#999900"> 
                          <tbody> 
                            <tr> 
                              <td WIDTH="126" HEIGHT="24">
                                <B>Name
                                </B>
                              </td>
                              <xsl:for-each select="../ShippingInstructions"> 
                                <td WIDTH="218" HEIGHT="24"> 
                                  <xsl:for-each select="name"> 
                                    <xsl:apply-templates /> 
                                  </xsl:for-each>
                                </td>
                              </xsl:for-each> 
                            </tr> 
                            <tr> 
                              <td WIDTH="126" HEIGHT="34">
                                <B>Address
                                </B>
                              </td>
                              <xsl:for-each select="../ShippingInstructions"> 
                                <td WIDTH="218" HEIGHT="34">
                                  <xsl:for-each select="address"> 
                                    <span style="white-space:pre"> 
                                      <xsl:apply-templates /> 
                                    </span> 
                                  </xsl:for-each> 
                                </td>
                              </xsl:for-each> 
                            </tr> 
                            <tr> 
                              <td WIDTH="126" HEIGHT="32">
                                <B>Telephone
                                </B>
                              </td>
                              <xsl:for-each select="../ShippingInstructions"> 
                                <td WIDTH="218" HEIGHT="32"> 
                                  <xsl:for-each select="telephone"> 
                                    <xsl:apply-templates /> 
                                  </xsl:for-each>
                                </td>
                              </xsl:for-each> 
                            </tr> 
                          </tbody> 
                        </table>
                      </xsl:if> 
                    </xsl:for-each> 
                  </td>
                </tr> 
              </tbody> 
            </table>
            <br />
            <B>
              <FONT COLOR="#FF0000" SIZE="+1">Items:
              </FONT>
            </B>
            <br /> 
            <br />
            <table border="0"> 
              <xsl:for-each select="LineItems"> 
                <xsl:for-each select="LineItem"> 
                  <xsl:if test="position()=1"> 
                    <thead> 
                      <tr bgcolor="#C0C0C0"> 
                        <td>
                          <FONT COLOR="#FF0000">
                            <B>ItemNumber</B>
                          </FONT> 
                        </td>
                        <td>
                          <FONT COLOR="#FF0000">
                            <B>Description</B>
                          </FONT>
                        </td>
                        <td>
                          <FONT COLOR="#FF0000">
                            <B>PartId</B>
                          </FONT>
                        </td>
                        <td> 
                          <FONT COLOR="#FF0000">
                            <B>Quantity</B>
                          </FONT>
                        </td>
                        <td> 
                          <FONT COLOR="#FF0000">
                            <B>Unit Price</B>
                          </FONT>
                        </td>
                        <td>
                          <FONT COLOR="#FF0000">
                            <B>Total Price</B>
                          </FONT> 
                        </td>
                      </tr> 
                    </thead> 
                  </xsl:if> 
                  <tbody> 
                    <tr bgcolor="#DADADA"> 
                      <td> 
                        <FONT COLOR="#000000">
                          <xsl:for-each select="@ItemNumber"> 
                            <xsl:value-of select="." /> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                      <td> 
                        <FONT COLOR="#000000">
                          <xsl:for-each select="Description"> 
                            <xsl:apply-templates /> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                      <td> 
                        <FONT COLOR="#000000">
                          <xsl:for-each select="Part"> 
                            <xsl:for-each select="@Id"> 
                              <xsl:value-of select="." /> 
                            </xsl:for-each> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                      <td> 
                        <FONT  COLOR="#000000">
                          <xsl:for-each select="Part"> 
                            <xsl:for-each select="@Quantity"> 
                              <xsl:value-of select="." /> 
                            </xsl:for-each> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                      <td> 
                        <FONT COLOR="#000000">
                          <xsl:for-each select="Part"> 
                            <xsl:for-each select="@UnitPrice"> 
                              <xsl:value-of select="." /> 
                            </xsl:for-each> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                      <td> 
                        <FONT FACE="Arial, Helvetica, sans-serif" COLOR="#000000">
                          <xsl:for-each select="Part"> 
                            <xsl:value-of select="@Quantity*@UnitPrice" /> 
                          </xsl:for-each> 
                        </FONT>
                      </td>
                    </tr> 
                  </tbody> 
                </xsl:for-each> 
              </xsl:for-each> 
            </table>
          </xsl:for-each> 
        </FONT> 
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
