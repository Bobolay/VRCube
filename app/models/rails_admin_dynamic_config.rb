module RailsAdminDynamicConfig
  class << self
    def configure_rails_admin(initial = true)
      RailsAdmin.config do |config|

        ### Popular gems integration

        ## == Devise ==
        config.authenticate_with do
          warden.authenticate! scope: :user
        end
        config.current_user_method(&:current_user)

        ## == Cancan ==
        #config.authorize_with :cancan

        ## == Pundit ==
        # config.authorize_with :pundit

        ## == PaperTrail ==
        # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

        ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

        config.parent_controller = "ApplicationController"



        if initial
          config.actions do
            dashboard                     # mandatory
            index                         # mandatory
            new do
              #except [CallRequest, ConsultationRequest, MeterRequest, ContactsRequest, PartnershipRequest]
              except [Cms::Page]
            end
            export
            bulk_delete
            show
            edit
            delete
            show_in_app
            props do
              only []
            end
            #edit_model
            nestable do
              only [Game, AccordionSlide]
            end

            ## With an audit adapter, you can add:
            # history_index
            # history_show
          end
        end

        config.navigation_labels do
          {
              feedbacks: 100,
              home: 200,
              about_us: 300,
              events: 400,
              services: 500,
              video_courses: 600,
              library: 700,
              contacts: 800,
              privacy_policy: 850,
              vacancies: 900,
              tags: 1000,
              users: 1100,
              settings: 1200,
              pages: 1300,
              assets: 1400
          }
        end

        config.navigation_static_links = {
            forms: "/admin/forms",
            mailchimp: "/admin/mailchimp",
            image_sizes: "/admin/image_sizes",
            locales: "/file_editor/locales",
            site_data: "/file_editor/site_data.yml",

        }

        #config.include_models Attachable::Asset


        #
        #
        config.include_models Cms::SitemapElement, Cms::MetaTags
        config.include_models Cms::Page
        config.model Cms::Page do
          navigation_label_key(:pages, 1)
          nestable_list({position_field: :sorting_position, scope: :order_by_sorting_position})
          object_label_method do
            :custom_name
          end
          list do
            sort_by do
              "sorting_position"
            end

            field :name do
              def value
                k = (@bindings[:object].type || @bindings[:object].class.name).underscore.split("/").last
                I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
              end
            end

            field :h1_text do
              def value
                @bindings[:object].h1_text
              end
            end
          end

          edit do
            field :name do
              read_only true
              def value
                type = @bindings[:object].type
                return nil if type.blank?
                k = type.underscore.split("/").last
                I18n.t("activerecord.models.pages.#{k}", raise: true) rescue k.humanize
              end
            end
            field :translations, :globalize_tabs
            field :seo_tags

          end

        end

        config.model_translation Cms::Page do
          field :locale, :hidden
          field :h1_text
        end


        config.model Cms::MetaTags do
          visible false
          field :translations, :globalize_tabs
        end

        config.model_translation Cms::MetaTags do
          field :locale, :hidden
          field :title
          field :keywords
          field :description
        end


        config.model Cms::SitemapElement do
          visible false

          field :display_on_sitemap
          field :changefreq
          field :priority
        end

        # config.include_models Attachable::Asset
        #
        # config.model Attachable::Asset do
        #   navigation_label_key(:assets, 1)
        #   field :data
        #   #watermark_position_field(:data)
        #   field :translations, :globalize_tabs
        # end
        #
        # config.model_translation Attachable::Asset do
        #   field :locale, :hidden
        #   field :data_alt
        # end


        config.include_models User
        config.model User do
          navigation_label_key(:users, 1)
          field :email
          field :password
          field :password_confirmation
        end

        config.include_models Cms::Tag, Cms::Tagging

        config.model Cms::Tag do
          navigation_label_key(:tags, 1)
          field :translations, :globalize_tabs
          #field :blog_articles
        end

        config.model_translation Cms::Tag do
          field :locale, :hidden
          field :name
          field :url_fragment do
            help do
              I18n.t("admin.help.#{name}")
            end
          end
        end

        config.model Cms::Tagging do
          visible false
        end

        # ===================================================
        # Requests
        # ===================================================
        config.configure_forms(:all)
        config.include_models HomeOrder, SessionOrder, CallRequest
        config.model CallRequest do
          navigation_label_key(:feedbacks, 3)

          field :created_at do
            read_only true
          end
          field :name do
            read_only true
          end
          field :phone do
            read_only true
          end
        end

        config.model SessionOrder do
          navigation_label_key(:feedbacks, 2)
          field :created_at do
            read_only true
          end
          field :name do
            read_only true
          end
          field :phone do
            read_only true
          end
          field :datetime do
            read_only true
          end
          field :players_count do
            read_only true
          end
          field :duration do
            read_only true
          end
        end

        config.model HomeOrder do
          navigation_label_key(:feedbacks, 1)

          field :created_at do
            read_only true
          end
          field :address do
            read_only true
          end
          field :name do
            read_only true
          end
          field :phone do
            read_only true
          end
          field :datetime do
            read_only true
          end
          field :players_count do
            read_only true
          end
          field :duration do
            read_only true
          end
        end

        # ===================================================
        # Application specific models
        # ===================================================
        config.include_models Game, AccordionSlide

        config.model Game do
          navigation_label_key :home, 1
          nestable_list({position_field: :sorting_position})

          list do
            field :published
            field :title
            field :youtube_video_id
            field :tags
          end

          edit do
            field :published
            field :translations, :globalize_tabs
            field :tags
          end
        end

        config.model_translation Game do
          field :locale, :hidden
          field :title
          field :youtube_video_id
        end

        config.model AccordionSlide do
          navigation_label_key :home, 2
          nestable_list({position_field: :sorting_position})

          field :published
          field :translations, :globalize_tabs
          field :image
        end

        config.model_translation AccordionSlide do
          field :locale, :hidden
          field :label
          field :title
          field :short_description
        end



      end
    end
  end
end