# module Aurora
#   module API
#     class Client
#       class Error < StandardError

#         # Raised when Aurora returns a 4xx or 500 HTTP status code
#         class ClientError < Error

#           # Creates a new error from an HTTP environement
#           #
#           # @param error [Exception]
#           # @return [Aurora::API::Client::Error::ClientError]
#           def initialize(error=nil)
#             if error.respond_to?(:response) && !error.response.nil?
#               http_error = error.response[:status].to_i

#               if ERROR_MAP.has_key?(http_error)
#                 raise ERROR_MAP[http_error].new(
#                   message: error.response[:body]["error"],
#                   validation_errors: error.response[:body]["errors"] || error.response[:body]["exception"])
#               else
#                 super
#               end
#             else
#               super
#             end
#           end
#         end # ClientError

#         # Raised when Aurora returns a 401 HTTP status code
#         class Unauthorized < Error; end

#         # Raised when Aurora returns a 404 HTTP status code
#         class NotFound < Error; end

#         # Raised when Aurora returns a 422 HTTP status code
#         class UnprocessableEntity < Error; end

#         ERROR_MAP = {
#           401 => Aurora::API::Client::Error::Unauthorized,
#           404 => Aurora::API::Client::Error::NotFound,
#           422 => Aurora::API::Client::Error::UnprocessableEntity
#         }
#       end # Error
#     end
#   end
# end