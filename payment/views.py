from django.shortcuts import render, get_object_or_404
from django.views.generic.edit import CreateView
from payment.models import Invoice, PaymentType
from django.template.loader import render_to_string
from django.http import HttpResponse
from homedetail.models import Data, DataType
from .forms import OrderCreateForm
from payment.models import Invoice


# Create your views here.

def show_invoice(request):
    user = request.user
    invoice = Invoice.objects.filter(PayerID=user)
    return render(request, 'payment/invoice_list.html', {'invoice':invoice})


def invoice_create(request, pk):
    user = request.user
    data = Data.objects.filter(id=pk)
    rate = data.values('Data_Type__id').get()
    date_type = DataType.objects.filter(id=rate['Data_Type__id'])
    unit_used = data.values('UnitUsed').get()
    for another_key in unit_used:
        amount = unit_used[another_key]

    if request.method == 'GET':
        form = OrderCreateForm()
        form.initial['PayerId'] = user.id
        return render(request, 'payment/create.html', {'form': form,
                                                       'data': data})

    if request.method == 'POST':
        form = OrderCreateForm(request.POST, request.FILES)
        if form.is_valid():
            evidence = form.cleaned_data['Evidence']  # clean data from the form
            payment_method = form.cleaned_data['Payment_method']
            payer_id = request.user
            order = Invoice(PayerID=payer_id,
                            Data=data.get(),
                            Rate=date_type.get(),
                            quantity=amount,
                            Payment_method=payment_method,
                            Evidence=evidence)  # make an invoice
            order.save()  # Successfully create invoice
            data.update(status='O')

            return render(request, 'payment/created.html', {'invoice': order})
        else:
            print(request.FILES)
            print(form.errors)
            return render(request, 'payment/create.html', {'form': form,
                                                           'data': data})





