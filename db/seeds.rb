# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create([{name: 'parbhat bus service',
                 address: 'rzh-391 raj nagar-2 gali no-12 palam colony new delhi 110077',
                 contact: '9818056706,9871743477' ,
                 gstno: '07akmpg7901j1zz',
                 state: 'delhi',
                 code: '07',
                 account_no: '',
                 ifsc_code:''},
                {name: 'parbhat tour and travels',
                 address: 'rzh-391 raj nagar-2 gali no-12 palam colony new delhi 110077',
                 contact: '9818056706,9871743477' ,
                 gstno: '07AHCPG7357F1ZF',
                 state: 'delhi',
                 code: '07',
                 account_no: '132010200010849',
                 ifsc_code:'utib0000132'}])
Client.create([{name: 'medicare agencies private limited',
               address: 'plot no 24, lal dora extn, bamnoli village new delhi 110077',
               gstno: '07aaacm0480b2zx',
               state: 'delhi',
               code: '07'},
               {name: 'global health private limited',
                address: 'sector 38 gurugram, haryana',
                gstno: '',
                state: 'haryana',
                code: '06'}])
Invoice.create([{company: Company.first,
                 client: Client.first,
                 date_of_supply: '31-07-2017 to 16-08-2017',
                 place_for_supply: 'delhi',
                 invoice_items_attributes: [{description: 'Total number of trips for tata 407',
                                             quantity: 19,
                                             rate: 1800
                                            },
                                            {description: 'Total number of trips for tata ace',
                                             quantity: 1,
                                             rate: 1300
                                            }]
                },{company: Company.last,
                   client: Client.last,
                   date_of_supply: '01-07-2017 to 31-07-2017',
                   place_for_supply: 'gurugram',
                   invoice_items_attributes: [{description: '39 seater bus(dl1pd 2763) shuttle service huda city centre',
                                               quantity: 1,
                                               rate: 95000,
                                               hsn_code: '996411'

                                              },
                                              {description: '47 seater bus(dl1pd 0347) shuttle service huda city centre',
                                               quantity: 1,
                                               rate: 95000,
                                               hsn_code: '996411'
                                              },
                                              {description: '39 seater bus(dl1pd 0749) shuttle service Ardee city',
                                               quantity: 1,
                                               rate: 95000,
                                               hsn_code: '996411'
                                              },
                                              {description: 'State road tax paid to govt for dl1pd 0347 (receipt attached)',
                                                 quantity: 1,
                                                 rate: 23000,
                                                 gst_rate: 0
                                              },
                                              {description: 'State road tax paid to govt for dl1pd 2763 (receipt attached)',
                                               quantity: 1,
                                               rate: 23000,
                                               gst_rate: 0
                                              },
                                              {description: 'State road tax paid to govt for dl1pd 1883 (receipt attached)',
                                               quantity: 1,
                                               rate: 6000,
                                               gst_rate: 0
                                              }]
                }])