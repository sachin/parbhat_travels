module CompaniesHelper
  def validation_class(object, key)
    return unless object.errors.any?
    object.errors.include?(key) ? 'is-invalid' : 'is-valid'
  end

  def error_message_present_for?(object, key)
    object.errors.include?(key)
  end

  def error_messages(object, key)
    object.errors.full_messages_for(key).join('<br/>')
  end

  def active_tab_class(active_for)
    controller_name == active_for ? 'active' : ''
  end

  def invoice_heading_row(invoice)
    content_tag(:div, class: 'row no-gutters') do
      columns = if invoice.is_interstate?
                  {'S.no' => {'class' => 'col-lg-1 col-sm-1 border-right'},
                   'Product Description' => {'class' => 'col-lg-4 col-sm-4 border-right'},
                   'HSN code' => {'class' => 'col-lg-1 col-sm-1 border-right'},
                   'Taxable Value' => {'class' => 'col-lg-2 col-sm-2 border-right'},
                   'IGST' => {'class' => 'col-lg-2 col-sm-2 text-center border-right ',
                              'sub_columns' => {'rate' => {'class' => 'col-lg-6 col-sm-6 border-right border_top'},
                                                'amount' => {'class' => 'col-lg-6 col-sm-6 border_top'}
                              }},
                   'Total' => {'class' => 'col-lg-2 col-sm-2'}
                  }
                else
                  {'column1' => {'col-split' => true, 'class' => 'col-lg-2 col-sm-2 border-right',
                                 'multi_columns' => {'S.no' => {'class' => 'col-lg-3 col-sm-4 border-right'},
                                                     'Product Description' => {'class' => 'col-lg-9 col-sm-8'}
                                 }},
                   'column2' => {'col-split' => true, 'class' => 'col-lg-5 col-sm-5 border-right',
                                 'multi_columns' => {'HSN code' => {'class' => 'col-lg-2 col-sm-2 border-right'},
                                                     'UDM' => {'class' => 'col-lg-1 col-sm-1 border-right'},
                                                     'qty' => {'class' => 'col-lg-1 col-sm-1 border-right'},
                                                     'rate' => {'class' => 'col-lg-2 col-sm-2 border-right'},
                                                     'amount' => {'class' => 'col-lg-2 col-sm-2 border-right'},
                                                     'discount' => {'class' => 'col-lg-2 col-sm-2 border-right'},
                                                     'Taxable Value' => {'class' => 'col-lg-2 col-sm-2'},
                                 }},
                   'CGST' => {'class' => 'col-lg-2 col-sm-2 text-center border-right ',
                              'sub_columns' => {'rate' => {'class' => 'col-lg-6 col-sm-6 border-right border_top'},
                                                'amount' => {'class' => 'col-lg-6 col-sm-6 border_top'}
                              }},
                   'SGST' => {'class' => 'col-lg-2 col-sm-2 text-center border-right ',
                              'sub_columns' => {'rate' => {'class' => 'col-lg-6 col-sm-6 border-right border_top'},
                                                'amount' => {'class' => 'col-lg-6 col-sm-6 border_top'}
                              }},
                   'Total' => {'class' => 'col-lg-1 col-sm-1'}
                  }
                end
      columns.each_pair do |column_name, detail|
        concat(content_tag(:div, class: detail['class']) do
                 if (detail['col-split'])
                   concat(content_tag(:div, class: 'row no-gutters height-100') do
                            detail['multi_columns'].each_pair do |sub_coumn, sub_column_detail|
                              concat(content_tag(:div, class: sub_column_detail['class']) do
                                       sub_coumn
                                     end)
                            end
                          end)
                 elsif (detail['sub_columns'])
                   concat(column_name)
                   concat(content_tag(:div, class: 'row no-gutters') do
                            detail['sub_columns'].each_pair do |sub_coumn, sub_column_detail|
                              concat(content_tag(:div, class: sub_column_detail['class']) do
                                       sub_coumn
                                     end)
                            end
                          end)
                 else
                   column_name
                 end
               end)
      end
    end
  end

  def invoice_content_row(invoice, invoice_item, index)
    content_tag(:div, class: 'row no-gutters') do
      if invoice.is_interstate?
        concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                 (index + 1).to_s
               end)
        concat(content_tag(:div, class: 'col-lg-4 col-sm-4 light_border_right') do
                 invoice_item.description
               end)
        concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                 invoice_item.hsn_code
               end)
        concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                 invoice_item.amount.to_s
               end)
        concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                 invoice_item.display_gst_rate.to_s
               end)
        concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                 invoice_item.gst_tax.to_s
               end)
        concat(content_tag(:div, class: 'col-lg-2 col-sm-2') do
                 invoice_item.total_amount.to_s
               end)
      else
        concat(content_tag(:div, class: 'col-lg-2 col-sm-2') do
           concat(content_tag(:div, class: 'row height-100 no-gutters') do

              concat(content_tag(:div, class: 'col-lg-3 col-sm-4 light_border_right') do
                       (index + 1).to_s
                     end)
              concat(content_tag(:div, class: 'col-lg-9 col-sm-8 light_border_right') do
                      invoice_item.description
                     end)
           end)
        end)

        concat(content_tag(:div, class: 'col-lg-5 col-sm-5') do
                 concat(content_tag(:div, class: 'row height-100 no-gutters') do

                          concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                                   invoice_item.hsn_code
                                 end)
                          concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                                   invoice_item.udm
                                 end)
                          concat(content_tag(:div, class: 'col-lg-1 col-sm-1 light_border_right') do
                                   invoice_item.quantity.to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                                   invoice_item.rate.to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                                   (invoice_item.rate * invoice_item.quantity).to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                                   invoice_item.discount.to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-2 col-sm-2 light_border_right') do
                                   invoice_item.amount.to_s
                                 end)
                        end)
               end)

        concat(content_tag(:div, class: 'col-lg-2 col-sm-2') do
                 concat(content_tag(:div, class: 'row height-100 no-gutters') do

                          concat(content_tag(:div, class: 'col-lg-6 col-sm-6 light_border_right') do
                                   invoice_item.display_gst_rate.to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-6 col-sm-6 light_border_right') do
                                   invoice_item.gst_tax.to_s
                                 end)
                        end)
               end)

        concat(content_tag(:div, class: 'col-lg-2 col-sm-2') do
                 concat(content_tag(:div, class: 'row height-100 no-gutters') do

                          concat(content_tag(:div, class: 'col-lg-6 col-sm-6 light_border_right') do
                                   invoice_item.display_gst_rate.to_s
                                 end)
                          concat(content_tag(:div, class: 'col-lg-6 col-sm-6 light_border_right') do
                                   invoice_item.gst_tax.to_s
                                 end)
                        end)
               end)

        concat(content_tag(:div, class: 'col-lg-1 col-sm-1') do
                 invoice_item.total_amount.to_s
               end)
      end
    end

  end

end
