package util

// constants for all supported currencies
const (
	USD = "USD"
	CAD = "CAD"
	EUR = "EUR"
)

// IsSupportedCurrency return true if the currency s supported
func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, CAD, EUR:
		return true
	}
	return false
}
